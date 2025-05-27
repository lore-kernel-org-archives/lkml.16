Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCC5C2ED
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349505; cv=none; b=l5AlwSI3SQ2uAmsjS6VvdrkIj5/54cKRfpFDs/vAFN3XyUKyQ56LwCsH6incH0uqPxxMBRaJrSQw+PPEiiEl6LCiM3VMqOavpcDMkIB+UqzIb3AfkzsVKIa0zKpiPjq5qq8jMwCOOkkPF/HE6MjK0JV+vDbXKwwqSYH4u6OOt/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349505; c=relaxed/simple;
	bh=yhtBO3wf7palizVt6znvkVnxx0yUDmqGPLTDw4mzg/Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kG/1FJ5MdM+aIfgP3JF09eaYmNFnO6Gpxqj8nvunvNXoK1WnWNq3eIxAOnvQEC7PyGwzdALBrucqVQXrz5BAH4cXt9co62YNWqXpO7GCYf0m766I75S+Y4MM/yg5pTLzmhKNnyL6snuQZNCb6pZQSJ5jZ8/IgBJZFoG7c0XL24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQA2piJc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQA2piJc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C5B0C4CEEF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748349504;
	bh=yhtBO3wf7palizVt6znvkVnxx0yUDmqGPLTDw4mzg/Y=;
	h=From:Date:Subject:To:Cc:From;
	b=oQA2piJcQc9SbUe+LzimA5pU/bq8kiYUJOdDS+qrAASyg82YxXinx1bdXjhlCWXG4
	 ccQvLxG2b/9a6VYvTHiJtVB5PbkQmKgygVzOchfCz3h2LjjQoLShTNPTcCSJTI78wP
	 h70RWflIv2zwfsWcnI5Dp7NnzdySv99E/SxCd3GDBz/EGBBX5m6oDghE37PwNpbUZV
	 6vfREo1Wrd+3RFwwFs+pCtAhKhO5CgHYZboQrJyrUyyLmnz143a/NZpRU3Ak4oM01I
	 /XuvBhB8aB3w594dVqlhsqRvhjjCc2GvkQoA325J5pLLvCRry9a34W7BUxBMyZ0TjU
	 QRLSrezObfiDQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad89333d603so91093066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:38:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YzNUp/TImuu6YCa/3e1XyJU56GpxSmFpqVqG+MFfI9NPfSYgfTl
	5eQ9IXzCbcNCBaMswni4Ck/MN63XvnKK0cr3dambV9ETfkP+1G7mf3OkADYQ0ErebeCu4BZ3Mf7
	HqtJ0Csd0q0UTcw5/cpFWnkZdvJYRndI=
X-Google-Smtp-Source: AGHT+IGIim51It5HRukuQmjH9d0SzzG8WmKIGLKlTziZyyIaOp5Qh33f/l67PWyNp08HchMbSr4SR2n1jRKlCFJb2Nc=
X-Received: by 2002:a17:907:9492:b0:ad5:43eb:d927 with SMTP id
 a640c23a62f3a-ad85b14e1f2mr1137751066b.23.1748349503135; Tue, 27 May 2025
 05:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 May 2025 21:38:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_vDJU-iBpWVC_6VYKH0YOGpZ9m5-9sw-kzDzyTgBAADg@mail.gmail.com>
X-Gm-Features: AX0GCFuyWIlzMbQB0Sn8A9fBVV04PxOblAWYJOT_MIsSrfixz13fUKlDo1hz20w
Message-ID: <CAKYAXd_vDJU-iBpWVC_6VYKH0YOGpZ9m5-9sw-kzDzyTgBAADg@mail.gmail.com>
Subject: [GIT PULL] exfat update for 6.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	"Yuezhang.Mo" <Yuezhang.Mo@sony.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is exfat update pull request for v6.16-rc1. I add a description of
this pull request below. Please pull exfat with following ones.

Thanks!

The following changes since commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca:

  Linux 6.15 (2025-05-25 16:09:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
tags/exfat-for-6.16-rc1

for you to fetch changes up to 46a557694b464881b3c2c4a0ba389a6436419a37:

  exfat: do not clear volume dirty flag during sync (2025-05-26 20:25:23 +0900)

----------------------------------------------------------------
Description for this pull request:
- Fix xfstests generic/482 test failure.
- Fix double free in delayed_free.

----------------------------------------------------------------
Namjae Jeon (1):
      exfat: fix double free in delayed_free

Yuezhang Mo (1):
      exfat: do not clear volume dirty flag during sync

 fs/exfat/nls.c   |  1 +
 fs/exfat/super.c | 30 +++++++-----------------------
 2 files changed, 8 insertions(+), 23 deletions(-)
