Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9481B95B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537255; cv=none; b=G04OMcgm4QydChiqLcqLPcD/UvWyCZ7ash9EjxmMV/M6L/L1WqbEgKd3s2MERHBWg7Kc1xz0DkAKsViRBnj7z6lux56WTP1cXchabYd6mXd0rh41iagFTWm/+rZWMslZnL8WoR1O1u6potNKGyo6h89A4Q0g1FRsspqVkp6Id1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537255; c=relaxed/simple;
	bh=UQw8PLFCVn+GRBoqlmEyr2k14Vw9FgKodvE746aNBcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upmhRjfUWWLh9bDFfjxPnZveVJDZVGH7WxGRtxXNFB+i7ceVj5eqM5C2VtgRrS9UDdLzM/bMQ8H616RMXoyI3h8v70WbqpR3rZLAYyTgo4QjJRwKpSuMvpyBBVxoKNdS20YBg7NbEHChtqVSw+yhiiubGBMf636ixmtdlJrey7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 83dde6fa57f511f0b29709d653e92f7d-20250703
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:21e0c986-6669-42b1-8596-4cfdedb62aa2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c5391f75d4344f6a4e0bf28554583991,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 83dde6fa57f511f0b29709d653e92f7d-20250703
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1683196157; Thu, 03 Jul 2025 18:07:23 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id A23FCE008FA2;
	Thu,  3 Jul 2025 18:07:23 +0800 (CST)
X-ns-mid: postfix-6866565B-5138481025
Received: from [172.25.120.24] (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 14CC2E008FA1;
	Thu,  3 Jul 2025 18:07:20 +0800 (CST)
Message-ID: <6414cb05-11d3-4b2a-ae97-7bb0ca0ea898@kylinos.cn>
Date: Thu, 3 Jul 2025 18:07:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp logic
To: Christian Loehle <christian.loehle@arm.com>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kprateek.nayak@amd.com, kuyo.chang@mediatek.com, juju.sung@mediatek.com,
 qyousef@layalina.io
References: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
 <675563a5-8f1d-4249-9828-9fb353dd7dd1@arm.com>
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
In-Reply-To: <675563a5-8f1d-4249-9828-9fb353dd7dd1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thanks for the question!

=E5=9C=A8 2025/7/3 17:22, Christian Loehle =E5=86=99=E9=81=93:
> On 7/3/25 10:14, Zihuan Zhang wrote:
>> Kernel threads (PF_KTHREAD) are not subject to user-defined utilizatio=
n
>> clamping. They do not represent user workloads and should not particip=
ate
>> in any uclamp logic, including:
> Why not?
>
As Xuewen mentioned, some kernel threads may intentionally set=20
scheduling attributes for performance. So instead of unconditionally=20
excluding all kernel threads, I=E2=80=99m now considering a more conserva=
tive=20
approach:
skip only those kthreads that haven=E2=80=99t explicitly set any clamp va=
lues.

This should help avoid unintended clamp aggregation while still=20
supporting performance-tuned kthreads.

>> [snip]
Best regards,
Zihuan
