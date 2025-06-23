Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C047262F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720509; cv=none; b=lv0NNGlkroN5LN3YyCdwsAWXyQw24qxMLyTByD8aqiEIOci2IR6AaNOF3UthPEqba8xG3lB98RJxBJoQ55U0xCsA7m/J5Gx41U/9qvL1tL+NxxEwp7HodCfgdQ/bVxgSuYO3T/GQe/Hynbba/7N38CnuRLZ0WJ1rGh31iaIuJI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720509; c=relaxed/simple;
	bh=nLbF7yQZl/o06wcIrZqIvhQsJtF3U4tJXhrfUtwcMHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/ny2lZRzCEt3HEZo8xiiE9Wbp6YUqtves7IQsvsAOeqJpZNoKitEXsR1t5ZIqpgIa6MAjMzb086qHoU+/dWV+qTSQgQpjP/l09v48eE2cN25Ylds0MhEDwQc8Xuc2aJE8C7Rgiuqu/Md5r8mAQ5oW2N87Mq969gZ6+hpM5ML+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b=giJ15HuI; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b="giJ15HuI"
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NMC6hn022325
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:15:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=facebook; bh=4
	9LAPUm1quHKTZyBFpiWIXjpujPBXo76XLo5wjg6XF4=; b=giJ15HuIb5xCux+0v
	LsYXt+PINlimWeuf73u+4a6rQlcvtKzdPVUUFOXp0W3/CHOdCyHBES+H1YuBL3MR
	Cf8h1BLSUKGyrqGWNfLHRCr6GuBYfL0X1sLy13mBmb5b0kCTZInPJKKCuXNC1t4+
	eyXMvcMIOMk62jnFHdvV2pIXCs=
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47f8f1c90c-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:15:07 -0700 (PDT)
Received: from twshared21625.15.frc2.facebook.com (2620:10d:c0a8:fe::f072) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.24; Mon, 23 Jun 2025 23:15:05 +0000
Received: by devgpu004.nha5.facebook.com (Postfix, from userid 199522)
	id 270981258C2; Mon, 23 Jun 2025 16:14:52 -0700 (PDT)
From: Alex Mastro <amastro@fb.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: Alex Mastro <amastro@fb.com>, <peterx@redhat.com>, <kbusch@kernel.org>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jason Gunthorpe
	<jgg@ziepe.ca>
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Date: Mon, 23 Jun 2025 16:14:48 -0700
Message-ID: <20250623231450.1326244-1-amastro@fb.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250623161831.12109402.alex.williamson@redhat.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2MCBTYWx0ZWRfX9hemdqS7PCJk C4XWP06d5nEQPliXybUIjD/vNknxCcqr74YeGsaJw7jAOqbGaGjactHkpQ0O1+EzaZLlid3a1QB EaB0sTDezXNtORCGOie8lJHhebikFjOrAr+DljlFZav+vDR+JjGN4qMv1KY/1Zchmg2D3NxeOGD
 O4wKYVBevUsKAYcD3T5Tceb9NS+usXfQCKTYIT2luJJlhBSBSWCvTtNpaKCkBIifL5QwquCDKkx 2oSoJdpTe7RDdyMV/78wWsUwnXruDV/HaH+wdpVlB8qxBrPwtWcZ9P+5H1rgbcF8eIdxg5uYFpT V0T959c13hSJL+LPK8+oeWKWciQ8GLK0P+pCwv5tfQe1IsmLwNzgagZy5FuAJemXvtTNPsHQ03I
 fncnLmnPwxMALuFvbDuCMReNED7PwYG7sU41MYrfzbql3zBDnIONJSfRVjYky9kxcB4MmusJ
X-Proofpoint-GUID: co_qvqbx123SztknLw8xzZAvY6jAvjAD
X-Authority-Analysis: v=2.4 cv=GeIXnRXL c=1 sm=1 tr=0 ts=6859dffb cx=c_pps a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17 a=6IFa9wvqVegA:10 a=20KFwNOVAAAA:8 a=pQO_QLq9p-wijE2fh-sA:9
X-Proofpoint-ORIG-GUID: co_qvqbx123SztknLw8xzZAvY6jAvjAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01

Hi Alex, thanks for the prompt feedback.

On Mon, 23 Jun 2025 16:18:31 -0600 Alex Williamson <alex.williamson@redha=
t.com> wrote:
> TBH, I don't think we need a callback, just use dev_name() in
> vfio_main.  The group interface always requires the name, in some cases
> it can require further information, but we seem to have forgotten that
> in the cdev interface anyway :-\

Sounds good -- I'll follow up on this in v2.

> > +#include <linux/seq_file.h>
>=20
> Only where we're doing the seq_print do we need to include this.

Ah, I only added it due to the direct reference to `struct seq_file *` in=
 this
file, but will keep this in mind. I do see that it's transitively visible=
 via
vfio.h's include.

> I think you're missing an update to Documentation/filesystems/proc.rst
> as well.

TIL about this documentation (section 3.8), but it looks to be focused mo=
re on
common fs/* pieces like eventfd, signalfd, and such. I didn't see any dri=
vers/*
precedence, but would not be opposed to being the first. Do you think it =
still
makes sense to add there?

Thanks,
Alex
