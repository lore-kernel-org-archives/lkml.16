Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4925A344
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746018736; cv=none; b=PtKtN+N48VqAT69oPv1E8alESMD9Jon6f2WENiUWV3qu58eG0AgiB/hL9wdteHbrkJ006hHB5ApZI1gyR5Tq9YBS4P/+BiF2K3JtQ5Ed+aMLMZls7Xx/qOxsbjmsjPwPvpFcmFQV4jATz+ENnx5x791bAO8TNSvh5HNsMOWnQts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746018736; c=relaxed/simple;
	bh=PIY85mKxHJ+UI+JYvM5nYj4nxGSfQYk+edb5eO6mGwU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sNmgEe3ZV/E2e9oNlvbQwa82R/DFLhXANfmVUJwIiRr9bpU6C5qXIfsWkNFpqIXtlT1UpWTm4yPZrNOP9TF60wi56NxB/zqVE+TKLVPJLXJZR+RZLpldu8FD43/R/0MA0p9paxJLn6qXc3ZwP38qg0KRgDIrdY/vMxnD7M9794E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FpV+rXuV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FpV+rXuV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acbb48bad09so24683166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746018732; x=1746623532; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjL1WsPsnsYmnWqXBUM0+iVtLhuhJsfn7GTamqYJHzY=;
        b=FpV+rXuVxEMyAIOv39lSq7WdWHbFs4cs34XtDbuohYbR6saOIG4TafjT5egHC74Og4
         kd0WoyTRilVQ0KAT+YwxB5JippkGc6cM6VSZsaumsHMZl3df7ctthoAPhcDatqldJZDt
         8qWJ8Bv3U++Iw/gjaPplZuM4SvhtkfSUtieOb53ya3b19YEgtYLGFCgto4IwTfi+U6Vp
         qDIkpJnY/XzxAoh00KE5U31j/gZ2iiDJ7Or16vE9MThCvnB0VkRjBqXz/vy0KKDagwDV
         jVrMCzMhNTVK/lN+65UEZAjs7LeNSEfG09P7TTfeg7jfSurbBD/iJLs2rptCpYqsBy6i
         8phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746018732; x=1746623532;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wjL1WsPsnsYmnWqXBUM0+iVtLhuhJsfn7GTamqYJHzY=;
        b=xFS2K8BVnTxFqmSfcE9NZAWWnupNgfDYzWwyjEctBvsKg84wJ1fCgCoBp1qpU8tgb7
         suNMbmNYsXtS3xFQA2KSzDmTCEvk4tdj3VQx+MGTQ4gOaQpx5X9bursY4/3AeATOBDIv
         1ehvYEMv+rVIcBqTj81vv0dFdB992LzCLP7vjG4rwpkHNA32r2V4AB1Ceyoi4a8Pk0l3
         OvEDP6dtBRBe3HMvfxW6hYjittlKn9+6GZJZxagIbCRC6NNNMjjyMCwtd1GFMBb5tHwn
         gCpbA12Fqa4XbbVMIXxlXVHhtYivtRjPwHPiOG5pElGMzpY9oRFMlwTyGKYJtatwq6z6
         Y1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcqDxB/Oca0acp6Cd98GHkmwD7VRKKNT9bIEd6+MDLpSFNv0ScRitB2wKTYv+ZQ8jObZLilhx/ZfjTnN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeOg8LnvdQHR4JySM+VeJ0QY1PNPqn4WSKFx/uaUetvFEJm73
	hOCZFxiuZZtnrujBsiSSjIAjNbz538TZ/Elbg5reRk/GrvkZJ901XopolNyREII=
X-Gm-Gg: ASbGncvFiL1+2+kfR5WPinio7rzLOoYAMhuXvevjCZoHV1Ek4/uangmMrV7TID0yM2f
	C4VNHkwisNvqQak2MG66hA4vE2QcyPpNrZ2gvByn3SQPZMeDleyfw4YF5TUl95XNoP5iRoh7APM
	J9hwBk5A19YF5rb5A3+3Kj8wapRu7uLjrzY6iQvqZHzHjRObLPidFtRGjlkMPdiN3cdsiF8O9B1
	Bfu9opIo8lgXRgk37Y1H6R+JmTAnz5PInrwywgivWNWsZA66ENisUGoIumi5mKgj7s9S8zDC/0b
	jvYtzkRBAHPpBXHBKFIpq+RlU/gKD9D3jzZsq6zaG9zEA1sx2wwsCQ==
X-Google-Smtp-Source: AGHT+IETi/U1rnwgErZQDP2Zc6pA5YllvKPlYnjKU6evHX11NFKR9wcmYXjnkl4EVs84aMfZNsIkIA==
X-Received: by 2002:a17:907:969f:b0:ace:3f00:25f5 with SMTP id a640c23a62f3a-acee21567bemr247077866b.2.1746018732276;
        Wed, 30 Apr 2025 06:12:12 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm926769066b.133.2025.04.30.06.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 06:12:11 -0700 (PDT)
Message-ID: <223a3bc5-0696-4547-b6ca-ab6882510259@suse.com>
Date: Wed, 30 Apr 2025 15:12:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shyam Saini <shyamsaini@linux.microsoft.com>
From: Petr Pavlu <petr.pavlu@suse.com>
Subject: [GIT PULL] Modules fixes for v6.15-rc5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/ tags/modules-6.15-rc5

for you to fetch changes up to f95bbfe18512c5c018720468959edac056a17196:

  drivers: base: handle module_kobject creation (2025-04-16 15:10:55 +0200)

----------------------------------------------------------------
Modules fixes for v6.15-rc5

A single series is present to properly handle the module_kobject creation.
It fixes a problem with missing /sys/module/<module>/drivers for built-in
modules.

The fix has been on linux-next for two weeks with no reported issues.

----------------------------------------------------------------
Shyam Saini (4):
      kernel: param: rename locate_module_kobject
      kernel: refactor lookup_or_create_module_kobject()
      kernel: globalize lookup_or_create_module_kobject()
      drivers: base: handle module_kobject creation

 drivers/base/module.c  | 13 +++++--------
 include/linux/module.h |  2 ++
 kernel/params.c        | 47 ++++++++++++++++++++++-------------------------
 3 files changed, 29 insertions(+), 33 deletions(-)
