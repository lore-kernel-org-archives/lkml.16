Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AEF9EC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743920729; cv=none; b=pEZ7sg6CE4/ylsXiSxzXv40k6rnc0fSzEWLL//KMKmWt4fMIdPjQjbnCKuZbbFJ9kxd4Pwtxo3RGM7yNy1KH4tfYHlsJ+q4zTj+i9f5lsPcFpqxwQ64Bh165HmIxkShf8gjXyHBLEz8SVpYAK4wDy+whx9Mp9pF90x4zhBHZUSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743920729; c=relaxed/simple;
	bh=k5TN1QfbnuKAa7k5GjF7mtqWFNBT+NG7z8QAuY++6mM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=p/W4FIhHT9Euk9cCp3+7tQtvJXr5AE6HqFe90moRB/zZbd+LBivZq8uhDzETj49OZ5cCgqp+cq4o2ngnq0Wu5KN/d4lEBUbX7LYOB0Qgss3kBc5j/wqSthRaTSLqiyul2wAk9e58dp2d7oStG2yOqfp065PRLDbcHt4/h7DodLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=m0WxbH3L; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="m0WxbH3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1743920413;
	bh=2qcf4GYZAvRhQYw5kTpGJMsX1msIyfD84M8VRVxJieQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m0WxbH3LMc8sm3YSySHIFOm08GmCXd4XlqXVnQogNjC04iyFVp0qPt3x25rFLUhqD
	 05VrUA4AAx1wYc4EEEu5X158iwB17vD7XyzJM8oKNV25gvOhGObeDeZBcOGCsDEx7X
	 RRq92q+yqvKMWwdTWOViqFPC5ENQWsjIM/GZL2w8=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 50B15ED2; Sun, 06 Apr 2025 14:20:11 +0800
X-QQ-mid: xmsmtpt1743920411tiiabvk4c
Message-ID: <tencent_474AC55ADEE443D037337A9ED09422D8C408@qq.com>
X-QQ-XMAILINFO: N9ponxXGLTJpktUrAobHCnlgpz7wC8z4PwrlKldDpds2YgJ5qWVld6sLwlKR32
	 UH+UF6W4W5XB4/a95tAZWeeQCR1PLOk7Dv7/OBfOC6bGpgNn/3L5M8/dViaWoCAFzpEuXdqeOMsi
	 EjTJBAY6xVI3Gxs/iDDDhxJOsYUobLWZJaIRKbnJUzDhrjQ5kA0/WZXNd6Oj5gVmHLsNTpQK/qZv
	 zAbdYuQCLvSIMFq/xugZtpu1MDIw2MiyRHbesboQktk5skgcbOQ0FZqAG+9rbPlXgw07mh6AbpwC
	 Y5vFogBPyWELMTI0xjYqf/2/VQ+rAfql3g70Hx8K3i6AwYMjL1FqffYiJc4u8iK8orMP1btoDmZC
	 PUrFuQ2OjZtm39HhnVwAd7waNIzZOciL45EZzcuCPQ2ukylgLI5Tt5BbLp3niJzc9Eepph+vOOi2
	 G4aosBjBzXab63wF6hhsPWNlU0oxsRO/9gdXFsPA2SgoJXYCs2xHzwsd8J9VzAzG72xduOc/Dg0p
	 qto9lERE8BoI4GxLt1RPugBbbCW09nNXKDmnbQFMrSzOR+ZYHL352n9jGU97utIPJqTkr/84GHFB
	 Agf/JiARL+srnX+lFWo4LJiVYEo3FzuByU9gg0xOd0OytnedQfZZ1D3mHs/kiAEa2foQ6bywecps
	 6TwT1FTkAYaq35WlIRLZTuh1a+hzyyAXscmcaRBLvTb6HKean3XUdTB2Hnk4K3z/enjAba7CPpam
	 D5oQdoW4aGzPxnO7aOMoBHhUWfa1ZPoAiGbf4+94zFWkWsyeUna/1IyOhobnSrK1JYukSK1WvNzY
	 T1W9Rlyz83f3oETOMn5kz67gxJUgW+k5nPvsDGHtg1g+DlIRCKGxADx98adt9SrVoUQaWJJQohZ/
	 YcXLaoMjd0olVSX1ScPKZdOYfPOoyO/QCuRr6PJfOpki1PEi5mmqAyRKDrMuiNU9gqxqr3WJnKjN
	 00/4brab3WeEzLUC0H7FpmqYnPSiDLkAYkfQJsF+PovRosFBROX0XinPR930RQfleCCQSIiqI=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: zhoumin <teczm@foxmail.com>
To: akpm@linux-foundation.org
Cc: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	teczm@foxmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH] kobject_uevent: add uevent_helper exist check
Date: Sun,  6 Apr 2025 14:19:15 +0800
X-OQ-MSGID: <20250406061915.1464984-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250405155207.aac347bcdc56e43cb0cae3cb@linux-foundation.org>
References: <20250405155207.aac347bcdc56e43cb0cae3cb@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Thank you for your feedback.

> Is there any measurable reduction in boot time?

This depends on the number of uevent and the performance of the device. 
In fact, I found this issue during a project to optomize boot time,
and on my embedded device, it can be optimized by at least 2 seconds.

> Cached in a static variable.  So if a uevent helper later becomes
> available, we won't know that and a reboot will be needed?

The static variable is used to avoid repeatedly checking for uevent_helper 
after the rootfs is mounted and uevent_helper is detected.

As for the uevent before the rootfs is mounted, that is another issue.
Whether I submit this patch or not, system always miss these uevent, because
queue is not used to handle this currently. In fact, I have also noticed
this problem, but based on experience, this seems to cause no issue.

> I wonder if this is the official/preferred way of detecting the
presence of a file.

For only checking file existence, kern_path is a sufficiently simple
approach, you can find it in many kernel lookup functions.

Let me know if you have further suggestions.

Best regards,  
zhoumin

