Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE786EBE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379785; cv=none; b=Mofx+a9r6222w8kiklMVKDmQePVMtdf5fi1JwfPUau2zctK4qy0grrxm5s+4oUJxV2DsfquhQLFxcEiZ/O0C6yzZr6F+mgWLOe6NJ/ssos/71nFx5hjL5ld2A2QqrnontUs2WQFe4sYPqXIsRz8uydL/lZ2MPX9FKAVULxpPn0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379785; c=relaxed/simple;
	bh=OO0KG1oSZUM8zb9pkCVYpDzSMHUSOqGx92lQEBiI9Ao=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=qfzDHUUD214T6+BBCbcyq60+a7G/rsZQQqzeoYBP3qZLomtkEfRWWZ/MmALLcQxQuIuZuuKTmpau8qiEST+Zc6PvO/LeI31hgsW/vYsIQcNkGsZh+nseT3HPFbn48Z+rvcSJt1cjdMDaSCHfjdsvZypRfnvrdjoM1P6ok3KELTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bNdnR5NBzz8RVF5;
	Fri, 20 Jun 2025 08:36:11 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 55K0ZNLI087195;
	Fri, 20 Jun 2025 08:35:23 +0800 (+08)
	(envelope-from jiang.peng9@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid31;
	Fri, 20 Jun 2025 08:35:24 +0800 (CST)
Date: Fri, 20 Jun 2025 08:35:24 +0800 (CST)
X-Zmail-TransId: 2afa6854acccffffffffe61-b190f
X-Mailer: Zmail v1.0
Message-ID: <20250620083524585H-Y-shkbXkJSd-9if1hTB@zte.com.cn>
In-Reply-To: <0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com>
References: 20250618100153468I5faNUAhCdtMA01OuuTKC@zte.com.cn,0f535bed-f4d4-4565-8f21-b10070f793e8@suse.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <jiang.peng9@zte.com.cn>
To: <jgross@suse.com>
Cc: <sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
        <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>,
        <xu.xin16@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0geGVuL3hlbmJ1czogZml4IFc9MSBidWlsZCB3YXJuaW5nIGluIHhlbmJ1c192YV9kZXZfZXJyb3IgZnVuY3Rpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55K0ZNLI087195
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6854ACFB.003/4bNdnR5NBzz8RVF5

> I'm fine with the changes as such, but please send the patch as a
> plain text email (no HTML). Otherwise I'm not able to apply it.
>
> You should look into Documentation/process/email-clients.rst in the
> kernel source tree.

My sincere apologies for the HTML format issue. Thank you for your patience and for pointing me to the email guidelines  - I truly appreciate the guidance.
I'll resend the patch immediately as a plain text email to ensure it can be properly applied.

Thank you again for your understanding and for taking the time to review this.

Best regards
Peng
