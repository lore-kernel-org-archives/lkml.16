Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6952417C9;
	Fri,  7 Feb 2025 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738900018; cv=none; b=Qbb/cUOq6qBsriVn2tR/FEO4bdAaoYF/2asCJpdnWpyLi6yk+8SngsYCwBJocyJk8ePcB7Fe+3nYuJQZq2NMV/aKcb/fi1zAEC5wCuPHOq15XeMCoAmBCr2W8EONBg7r5dVaC7AZL8D9s7tNOGGJbaBTWQvljShtW1b3xvwCYFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738900018; c=relaxed/simple;
	bh=yLHiDxUpDWaoFK3S3eglnjxOL3NunAMN2VHpusUiziA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qQ037XIe3kctatQ1Fy8wEBEEquI910mbf7hUDv30U3mSTE6NidhSWd48q7IXQNmcCsJQMJ9D4nHySd03ra6kLi97+zraQXXn2GgPAHnxYMYcsa24DuxPl6AciCmv1KSp2HoNQva+hM1TWVnE5tPYhQD4nIEW+2GeMGqgqJDI+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1QSL7B9; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1QSL7B9"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46fee2b9c7aso14112631cf.2;
        Thu, 06 Feb 2025 19:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738900015; x=1739504815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUgshD4k7+DeHbdvE2lo1G+Dt5NqluPiGTxoQ6J9L2E=;
        b=M1QSL7B9ABz2yU7YW995G/KBCfDpc8TA4baDZMuxXOOWZaH9qljqdxBm4m/quEpbR5
         QciiYPOQ6GwtkACoZa5VqdCr0R/7os+m3uGBYwCOeQLkZxrLnLKR5lH2lxL8vcohOHcV
         FnqI2ctWZIOGOOsxiOsejIQn+T4Uu+5LgC/3LvqrRtUkNtkkrzVBo5RrXNs1Djmh1LdV
         fpeajbZUd2YkijV2uVXpuokHSIE1huovDS5PmT8ZZ0KLDjBeWrybl5PTfVOM5+wbQ3sS
         cX7dRMOVWDg00Osct40KiKllGqmm1tfZc0GK62l7eDgbrAMlIpl1I9ZznmpWmISt7Mdm
         cz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738900015; x=1739504815;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUgshD4k7+DeHbdvE2lo1G+Dt5NqluPiGTxoQ6J9L2E=;
        b=jUXyb/OGAt/Y9vkxGPs24JjRRE7fCPnFhhCf0rXFhKVVpiyWg6KMLUWQtETWmhCFVJ
         SbugzeJMtd6cB1f8hbBo9KAsSnjoppWNprLHK9vBMwuOUwVSebKqR6PvFE7oMUl9oipR
         V54goN2CmZWLRJipZLpzA4XrV9vpFXdDznE0w0mPRtlPOg5c1XcV2DdGEhb9Qe0uOQ7l
         +9KxW8DEFaCheAEqHR+q9f6apiQ8Nb7nLnlPPdVccHlq686BRhLlyoAtw4nwDMvItXmK
         v+xxPquWTJZRpvSXzrs3fkcSlCHzZJHSWZCsfLImP9M8C129GEmswdZczQ2j5tk281UG
         uPoA==
X-Forwarded-Encrypted: i=1; AJvYcCVbl2vGHSBDhC80DgyAorwICkUKry87/0J7xu6H66IW+pe/jesNOpv2Eu7s/TFpr0VJGcT9YZQVS1qeuuAM@vger.kernel.org, AJvYcCXSe7D68pfHRz4DiJcUae4q2lVbWS8FpHhjGCMmTMJHC7t6s4hsYdISGwAyjPdy7wbRGYToqLGJ9iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPiT3lYDuz5PM5kurhNb14ckkfk2+Iqyb4269tFzz0X4mfw6/
	zUXs5vEZwOCR4d8IWpRiIH940xf6P3+AyrWqt+T/JaZJFx9Ich1c
X-Gm-Gg: ASbGnctsUmSxGvZ8yO5DYpuBlFzEYLIZrfG/mRUD/x9oZ/Ls6ebNWNNoCI/xiDG1Ti9
	To2rXlccGn48JtrkWN8MPfmqqfmd3C0AQVzBvuZ2XCE8C7dfUy//qeTLQ8seTF9OVP7fjjMo2mM
	Ltggui61dlRK0xKwDZLQAJwFgLgosgG6KcyWkLKJyytw51FdhFY3sBTJfJuaAVX2xNMxlOj41i3
	Cqcs/bxviyuhkBHvwi/jkMAgwpW2LJk1OCXTRPjWEcjzQCp49JekqiTZwt2rXJIdfUjg4dKkOA6
	Dcq0ISiPMUWDiLfdZ9R/L7xzM4K2zms943dw9qf/sEiBLkkEyPzjv5iizQ==
X-Google-Smtp-Source: AGHT+IEm3BdSe+q9WBSKEcsae+Hf1w+7IXInI0crzAEIRMQZhsnXJTj+cQiEaklGauUKMdmGN54b2w==
X-Received: by 2002:a05:622a:90:b0:467:672a:abb8 with SMTP id d75a77b69052e-47167993229mr27416671cf.5.1738900014318;
        Thu, 06 Feb 2025 19:46:54 -0800 (PST)
Received: from [192.168.1.105] (c-73-176-204-61.hsd1.il.comcast.net. [73.176.204.61])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041eb7a01sm138122385a.95.2025.02.06.19.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 19:46:53 -0800 (PST)
Message-ID: <f68426ac-d8ec-4a90-a683-ca157719c7d5@gmail.com>
Date: Thu, 6 Feb 2025 21:46:52 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Eric Salem <ericsalem@gmail.com>
Subject: [PATCH] Documentation: gpu: Fixed typos
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fixed a few misspellings.

Signed-off-by: Eric Salem <ericsalem@gmail.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 256d0d1cb216..7cc102f1571a 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -294,7 +294,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -319,7 +319,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -838,7 +838,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.48.1
