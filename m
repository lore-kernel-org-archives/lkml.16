Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7397219317
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997801; cv=none; b=qPpjcr/ggbvXBpM5s+zGcQshSymXEazz1H6pVuNqZzypFHZYR6tWKtdO4b5ZFusBWIxCMz3M+MdcYvjwMSW6ot4BVVnrKbvBw+p/FdZL5yA5vKBHFKlR9H11creuZ2L764gduDUf6o6mABMyXLH+qa9ZT+1N8qBCsWWLXOceJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997801; c=relaxed/simple;
	bh=R34D2cd8U0Oo4XpxhyPYZ8p1YJ4Y/AcPqNPvxGDq+0c=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=DhKXKzvTU3EpGlQRxyxG0Ttufe46WANkoYhjEtdtT6rJWMsM6Wt2Wxy03wQ/Lqdkp0MuaVhJl4dKn7awqa2OtvOfkuERJ+pAjp7GyR+Ncu3hhtLnltNJM55mPUNHvVnTuWBwM1OvqdbJysMUHUIf7hMjoTv7JtQWzpg6EzOdXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IXNUPSCz; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IXNUPSCz"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-8616987c261so68754339f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744997797; x=1745602597; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m8FuswRd+LkCbDl77a1I/+S6+77gUYhNyTsfPKu3Ik0=;
        b=IXNUPSCzsngi0sbeFhMQK6W+DTk+tmWqcQCnVwoETdBM62Xk1VT2XIlBIEXjl7MhYv
         YO/4JBj2oo613D6HPdMjviL+wvsti6/568LnCBT2rcayMV3npZ0aP+npekmv0OpmBYSI
         6xRKIQjK0eIyM/Mevm0cY0H2PLTRsl5rDg07M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997797; x=1745602597;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8FuswRd+LkCbDl77a1I/+S6+77gUYhNyTsfPKu3Ik0=;
        b=WqE4HPAj/Du68NnbHPWSpaJARFBziDIZa/2fVtaL1wVytenL8Q3DgwaderolDKQ+Kf
         Dhn6Oh9F9Kewm1G+ck2mbjbN38Sda8LROCnHt0r9dG4n0oT6so+2EuRQx3pdGbDOxKkk
         Z3UBS2GDYMTMz+MSKPxznhJIEIMbvkZVz9sc62vP2YgEE7KOF7SBhI2wCSagZ438S7J3
         PJf3JaJqwvHZi2knbg309721F2IJxyzVd7vOHHJZfvDdtSR7udu95zt5GvbOGWRIbgBQ
         QT8h88w+vC5S9dTlIW0VRz+gECPpgdiKi2mnlErdNV2oSxW/ubOs8l2A66GqcFssWL+s
         tPLA==
X-Forwarded-Encrypted: i=1; AJvYcCWB1uV/PLO+C/1onkFk1e75vxl0wXN12feGmDf/E1mTNuG5nnsFd3H2O5d0MZNez/CPa3rb6dxACCHAkbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmWdXOvvnRMBM9jXMzKFPPphAbfYlGj6M2+tg6lSBuVCS9kn1V
	SLjMtYXusc+RpvSYV+3hn9sZWZ45Uc0uBAS+TFspBDev4QvNr4CIBV7ecCP8f0M=
X-Gm-Gg: ASbGncs+ePA4sKckjBaejnIhR/0lhZqEo8auGdwpEfCRw9tWXRJcAiQOSOpogzeLrhv
	j5sfx2n/ZhtVMFXWn0hLPFe0wlGUkF3obh0CVnLHSw8DLmjRVW86YRPrtWnvuefEMpdBcuJj6yE
	aC28O2+ZilA4KU94ltyWxN5ABDPdW0tw1b02gs+0uoPS7QykDaNUBkNyd+imIqraMF4mijUNDGq
	D6MVpfAqdEM9NbhA0kiLVzAuNaaLxzM4rEgUEsFPQk93ePlbT97iaS6N86lzua6pYQHtcHDlbQd
	Y91bJOrXRQ1hJFk53D4R7bRLwjG75FDWoq5CTx6pWTeL/mq7A8Y=
X-Google-Smtp-Source: AGHT+IFWSDYfz3DS8oUsN8fbmYzwhJqsntDPJnXrPwPX8tSDMwmhmze2oR2gntS2tenEf0+zCh2+GQ==
X-Received: by 2002:a05:6602:4c0c:b0:85d:a235:e90e with SMTP id ca18e2360f4ac-861dbedd4aemr326836939f.13.1744997796801;
        Fri, 18 Apr 2025 10:36:36 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861d95f744fsm45413039f.12.2025.04.18.10.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 10:36:36 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------s0hP850HvPRCKwCEgze0ZPF4"
Message-ID: <f8deb2a8-9e3e-4ab4-b28f-d685896bb702@linuxfoundation.org>
Date: Fri, 18 Apr 2025 11:36:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] kunit fixes update for Linux 6.15-rc3

This is a multi-part message in MIME format.
--------------s0hP850HvPRCKwCEgze0ZPF4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull the following kunit fixes update for Linux 6.15-rc3.

Fixes arch sh kunit qemu_configs script sh.py to honor kunit cmdline.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

   Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-6.15-rc3

for you to fetch changes up to b26c1a85f3fc3cc749380ff94199377fc2d0c203:

   kunit: qemu_configs: SH: Respect kunit cmdline (2025-04-14 10:08:01 -0600)

----------------------------------------------------------------
linux_kselftest-kunit-fixes-6.15-rc3

Fixes arch sh kunit qemu_configs script sh.py to honor kunit cmdline.

----------------------------------------------------------------
Thomas Weißschuh (1):
       kunit: qemu_configs: SH: Respect kunit cmdline

  tools/testing/kunit/qemu_configs/sh.py | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
----------------------------------------------------------------
--------------s0hP850HvPRCKwCEgze0ZPF4
Content-Type: text/x-patch; charset=UTF-8;
 name="linux_kselftest-kunit-fixes-6.15-rc3.diff"
Content-Disposition: attachment;
 filename="linux_kselftest-kunit-fixes-6.15-rc3.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvcWVtdV9jb25maWdzL3NoLnB5IGIv
dG9vbHMvdGVzdGluZy9rdW5pdC9xZW11X2NvbmZpZ3Mvc2gucHkKaW5kZXggNzhhNDc0YTVi
OTVmLi5mMDBjYjg5ZmRlZjYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvcWVt
dV9jb25maWdzL3NoLnB5CisrKyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQvcWVtdV9jb25maWdz
L3NoLnB5CkBAIC03LDcgKzcsOSBAQCBDT05GSUdfQ1BVX1NVQlRZUEVfU0g3NzUxUj15CiBD
T05GSUdfTUVNT1JZX1NUQVJUPTB4MGMwMDAwMDAKIENPTkZJR19TSF9SVFM3NzUxUjJEPXkK
IENPTkZJR19SVFM3NzUxUjJEX1BMVVM9eQotQ09ORklHX1NFUklBTF9TSF9TQ0k9eScnJywK
K0NPTkZJR19TRVJJQUxfU0hfU0NJPXkKK0NPTkZJR19DTURMSU5FX0VYVEVORD15CisnJycs
CiAJCQkgICBxZW11X2FyY2g9J3NoNCcsCiAJCQkgICBrZXJuZWxfcGF0aD0nYXJjaC9zaC9i
b290L3pJbWFnZScsCiAJCQkgICBrZXJuZWxfY29tbWFuZF9saW5lPSdjb25zb2xlPXR0eVND
MScsCg==

--------------s0hP850HvPRCKwCEgze0ZPF4--
