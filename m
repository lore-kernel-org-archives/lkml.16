Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD5C2D4B55
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533412; cv=none; b=ftLu3F3i37xHm5pdZfJOYtr5ZUlYBEWXVvcWxlZqFW1m2dGfhqIKPz4bOecXKVhHlGwAssZpQCdwwBul7G5xvuIeC79BTGv5w5lz5E/IcHtCpsFyYLxOlG8ARVOfNdFvPN/VzmeyIMoD01D4USLzBnWh+d9yy20GM5yws/neAJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533412; c=relaxed/simple;
	bh=wkMSTJsx/+IC5Ok00gyscpxoB5n9NvvIPubwcrMo0ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DYym5t2qrU4tIk4DLnEi28oWHS70j7NHVF07m6IglTOEaAvZfgfcQUsM6m8lhiH4yvzIF6nT/PZrzqEg45DlkghY8XTwhEcHDwtirCYPZr0W15a6JOaby2IG7qWUqO+AB8th8anPrb9mjZ1zKba3qf20esNOFeV3kUKAVgWckaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9080bd5a57ec11f0b29709d653e92f7d-20250703
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:da777e99-f0c6-4187-b65b-15b9de72c4ab,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:56952bd973e847d1b733ae4473017cdb,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|52,EDM:-3,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9080bd5a57ec11f0b29709d653e92f7d-20250703
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 389063183; Thu, 03 Jul 2025 17:03:19 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 6457DE008FA2;
	Thu,  3 Jul 2025 17:03:19 +0800 (CST)
X-ns-mid: postfix-68664757-256782844
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 25775E008FA1;
	Thu,  3 Jul 2025 17:03:14 +0800 (CST)
Message-ID: <11840c1e-afff-4004-bc4c-6c88b3df02fa@kylinos.cn>
Date: Thu, 3 Jul 2025 17:03:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Skip uclamp_rq_dec() for non-final
 dequeue of delayed tasks
To: K Prateek Nayak <kprateek.nayak@amd.com>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kuyo.chang@mediatek.com, juju.sung@mediatek.com, qyousef@layalina.io
References: <20250701093407.211500-1-zhangzihuan@kylinos.cn>
 <3882929e-d4a1-48b3-b518-1582e6e1c872@amd.com>
 <0396755a-58be-4f7d-99f9-6b63d35e6e65@kylinos.cn>
 <1b0a41ce-5fcc-4ea8-83ca-a2bd5ef765c9@amd.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <1b0a41ce-5fcc-4ea8-83ca-a2bd5ef765c9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Prateek,

=E5=9C=A8 2025/7/2 11:12, K Prateek Nayak =E5=86=99=E9=81=93:=E3=80=80 =E3=
=80=80 =E3=80=80 =E3=80=80=E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80=
 =E3=80=80 =E3=80=80 =E3=80=80=20
=E3=80=80 =E3=80=80 =E3=80=80=E3=80=80
> On a closer look at uclamp_rq_dec_id(), I think "uc_se->active"
> will guard against a double accounting. But that is not a good
> reason to sprinkle redundant calls.=E3=80=80=E3=80=80 =E3=80=80
Thanks a lot for the clarification!

Best regards,
Zihuan

>   =E3=80=80 =E3=80=80=E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80 =
=E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80 =E3=80=80=E3=80=80
