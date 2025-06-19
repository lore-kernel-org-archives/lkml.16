Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BE634
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303852; cv=none; b=TJXf8/qcrAVehDM7k6UQhdvaoiIf1uJKhNb2BHpUvt4+pvevbqHTFAfdZ8Y2NpKrlZWaWvk3ImEFhPh5kHLk1DOMOzPhXTHHo2KHC8mH9VP7oLDnpE1XH/bR+epb9lT0Ksp/3cZ96oMXGhNB9qi3dWSx3XQlLWWPcKfuMAJV97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303852; c=relaxed/simple;
	bh=k8pn7zG8bcI0oxQJLZIKkKfC6llbBeRdhqTiPfyT40c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnHrs5M7CP+jTfN0vQsbiSKaa9ZFLvurOlrhkTGtD06uFMO73w5Vk2dMW3sQbFEmBLZOMirVNHtMnw0fIYkE7si93pqiL+yieydaONr8KsFJqALsLlj8rBcYWpF7wFHEzVZb6BIEX9aLznWeVWKcP+zCncqB4e8A/u4kiSn1ZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c6f9e4cc4cbd11f0b29709d653e92f7d-20250619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e7df3af4-1a7b-429d-abb7-2717a4942115,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:69c1857e1b39316d3d6dd32f8eda583a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|50,EDM:-3,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c6f9e4cc4cbd11f0b29709d653e92f7d-20250619
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 625284536; Thu, 19 Jun 2025 11:30:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id B8281E00891C;
	Thu, 19 Jun 2025 11:30:41 +0800 (CST)
X-ns-mid: postfix-68538461-621120757
Received: from kylin-pc.. (unknown [172.25.130.133])
	by mail.kylinos.cn (NSMail) with ESMTPA id 0FB99E008900;
	Thu, 19 Jun 2025 11:30:39 +0800 (CST)
From: Yunshui Jiang <jiangyunshui@kylinos.cn>
To: liam.howlett@oracle.com
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	jiangyunshui@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-mm@vack.org,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz
Subject: Re: [PATCH] mm: Inline vma_needs_copy
Date: Thu, 19 Jun 2025 11:30:07 +0800
Message-ID: <20250619033037.1073740-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <6otznlgh567keer6aj2jcfbzgvf2hmfxd2nhfp6qnv53yh3upf@iq73dot6ec5o>
References: <6otznlgh567keer6aj2jcfbzgvf2hmfxd2nhfp6qnv53yh3upf@iq73dot6ec5o>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable

Initially, I added explicit inline hints in the code precisely because so=
me
newer compilers might ignore such suggestions.
=20

Based on everyone's feedback, I rechecked my compiler configurations

=E2=80=94ARM64 uses GCC 12.3, while x86 uses GCC 12.4. By analyzing the

disassembly of vmlinux via objdump, I confirmed that vma_needs_copy

is indeed inlined in both cases. In this case the score difference in spa=
wn

might just be due to fluctuations.

=20

Leave it unchanged might be better. If we later encounter issues where

older compilers fail to inline single-caller cases or multiple calls are

incurred due to code changes, we could re-discuss  whether manual

intervention is needed.=20

=20

Best regards,
Yunshui Jiang
