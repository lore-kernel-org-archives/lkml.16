Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD71E32B9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791280; cv=none; b=KOL86MAxGqeIm+SHDsts1zG8uT0t/lM/cC0EnsQh31+LZVf+IJFngbo1Uuh/maFbb3a7Q6eSYVXlxp+Vd2tgF9QiFVisUjRsafkh8CB2jir8nIniRsbLEb0WABRY37tKp7mMff7+wkDqRkeS19/YMfRzdVMQcZmNLPhBbe4uQeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791280; c=relaxed/simple;
	bh=c/y3xXMbDdtlBwDY0/y4GK/bkN2xFaQdAi2da5gKUyQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JN0TQ+VB3h/O0Bifay1vjHIxsFdZ1ZU61nP2V01PXYkCEmJzV6+bNFrUpzka6b1aXR43WVR3fgV0XZZgyMrfLJEjtNCqvOL7G1/7Ux7NrpVREu/jg49qMlgYwB/w6KYAhorlU7m4iY3U1wV+rSkfNH5iC2cRhS8GpIy6MgGvkxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b=EGIvJZMB; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b="EGIvJZMB"
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OI7GqX001557
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:54:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=facebook; bh=c
	/y3xXMbDdtlBwDY0/y4GK/bkN2xFaQdAi2da5gKUyQ=; b=EGIvJZMBV8GTDF/lP
	H85JjHyaFPqpyh5GNV1W06BKyo1f0m8tNt5R1A0BTsWjkZ7dmBXsNMSpDKVCYxC/
	2JVK3+vieOlwD18/6CopplOeJugElWAqqwd0il9KT1xt2RdPE6aWI6RaquOqUDZB
	TlNOhRVLA85/SQuWuN7qA/yufc=
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47fkh5nx3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:54:37 -0700 (PDT)
Received: from twshared21625.15.frc2.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.24; Tue, 24 Jun 2025 18:54:36 +0000
Received: by devgpu004.nha5.facebook.com (Postfix, from userid 199522)
	id 8DE441AD75B; Tue, 24 Jun 2025 11:54:26 -0700 (PDT)
From: Alex Mastro <amastro@fb.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Alex Mastro <amastro@fb.com>,
        Alex Williamson
	<alex.williamson@redhat.com>, <peterx@redhat.com>,
        <kbusch@kernel.org>, <kvm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Date: Tue, 24 Jun 2025 11:53:25 -0700
Message-ID: <20250624185327.1250843-1-amastro@fb.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250624181616.GE72557@ziepe.ca>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: IkJQYUJuodauQ3lAQBIjhJQZqGJCtTvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE1NSBTYWx0ZWRfXywcvGJk+7EEd 2m/s3vYRZCUMJ2nOrYyRFevYXvppv4t/5lHS4FxONQyzmZilwBPgU6RENx0BMrU5hIgm+ukcGZX aO08UX9ZL5lfHd29paw77Q+HnflVeVfp8z8i+kUF+xYZCf95iKqS71spJZWFugnq2UAqT+OOGpU
 SV6m/wMgvsxtap1+iYkt+OupaIoXLyl/1UnkDRbZ9TAKNcYhn3wgSv0dDZc+wDW9jW6/tPixMNw BYLyAq27tzEJ/zh3D8fSthf2tkf2JQHvpu31ff81tohjCxfSI/6ySRs7EAfHp8AWwrP6PqmI5yx hVsbju4rD3gg+sSb8vqkLx7HSscumyPdaJTYwhZ8aW4hCIPAbMt/OVj5NE0Xwvzv58t3PormhzZ
 nCwGN161AtAoGWRde9AFKqSyZGh0lXHP/69MLwzxzKlWJDIbtXuRl0PFdhRyvwTsk7hesM9u
X-Authority-Analysis: v=2.4 cv=IZeHWXqa c=1 sm=1 tr=0 ts=685af46d cx=c_pps a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17 a=6IFa9wvqVegA:10 a=9jRdOu3wAAAA:8 a=y_P49Qpdh_UukDKHNdIA:9 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: IkJQYUJuodauQ3lAQBIjhJQZqGJCtTvG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01

On Tue, 24 Jun 2025 15:16:16 -0300 Jason Gunthorpe <jgg@ziepe.ca> wrote:
> There will be a symlink under /sys/class/vfio-xx/XX pointing to the
> <pci sysfs path>/vfio-dev/X directory
>=20
> And another symlink under /sys/dev/char/XX:XX doing the same.

Got it, thanks. The issue does seem solved for the vfio cdev case, then.

Alex

