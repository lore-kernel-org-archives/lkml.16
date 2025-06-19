Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798492441AF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313506; cv=none; b=rXYWYr3NsK3AQFmQf9HLahbfyd/gi4LxwkTOzhpq6zTgRMVdhlh77hbgqnX//9lIMBMVxVcK9zvXbYsyPG7hYE/vK8DTLRY6cytdF3t9YDMgQjGIupGvA8SE/M0obBo3uR8m77JmL1zmMAZM+j+NqKYgPnsAj1QPEgVCVFrcjfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313506; c=relaxed/simple;
	bh=FdnjERN2rsLpylt9y6dmOsTnu4+dpk0A+z+onyoqjzc=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type; b=i6rfa/R13MNeZtuGIJU78X1/GGmR4ETYeWdSOCQmMQD3bGFJR11kQZUsgJ1Jx3kwJwvGGw2x6onkj1Cc9dZgGGpE+VFaWsLwghv8ZRn+QDW0bp58NeD3DLox2lkxd3SV+ybZh/Dx5VokYDywxO0fBxM5dmdxAzExt+wSBf0Oh8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6j4ttXV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6j4ttXV"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso305814b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750313504; x=1750918304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FdnjERN2rsLpylt9y6dmOsTnu4+dpk0A+z+onyoqjzc=;
        b=Y6j4ttXVNvibXO82GXoRwa0ur9xw5FYyu5YCZAKGNYYc0g87CHOaPwZ8Gom+VLhEu9
         TVcDFenYCcHbBWmQWckbv4c0GvkH9oaWGW8aCNswDMmjwEzlYqA6+y1Tcmz9q5+it4gF
         5xuAWIKOrHi2FOrukBVOUoc7+AFDNPHc41ebqdPKO+LZqA2IhCXtLWDw5B73ZA1rNxlW
         Kw1SlSEYgQ3hVFu8G2GUgiXMvWj0YHWEwD5EOKW7uxbAIUsEkfENoZ+uuhVSFKw65fAx
         gMfLGpCDFqSvAvppvYBZtlI5SPdpI1dWYNgw31fpHGLhVsXqetJwXRJK/jcdqs5R9mc7
         6shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750313504; x=1750918304;
        h=content-transfer-encoding:mime-version:message-id:user-agent
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdnjERN2rsLpylt9y6dmOsTnu4+dpk0A+z+onyoqjzc=;
        b=sJPtFIehqaK9D3zgqzmK/RZw3y0jw5K7j4LoccY8FMYU7Hvu5xQeQYq+qbqXt6/PwC
         I1xMx+jV0xUfTfTYEt8fFl8P9iQ8mj9icUQ1sQwCNDOHYg6ZIdChCKTHvvrmFNefbgfO
         433y3/3ck/agPc8WllpuLV9KOfcQeOfpCwjU/pcqXXvlxdCzHjDPSpbriQ6mCklIBTaX
         nuLa/dTuVZBC/bxflnGO3jhlNAKyMLlXuXjoEus791rsyTi89/J4zinSCrTQVW/M6xBV
         sIv0jwTPsM4VOtIzFcLchXW5sjre2/4/Vn7xvK0lUvShSoL1a2fXsY2uwsrd05mEzb3g
         /bKA==
X-Gm-Message-State: AOJu0Yyg+0q+K5Z+p5pWR06hf43jSzYA8owWnPBxFizF/YFwY5vWv7Iz
	p5j4kRZcSAdJWbwj55G9IkXLyeRNhIcIGmHV2PIVjPygEVhfAAJiAaaCL3QyMUWP
X-Gm-Gg: ASbGncsEr969wMAENp411WH8r723h8hRIY4hmQ4RWaUgmcwF/DwxBJvVQlNQKK8ohy0
	kdIeUveRe3x0yp7OCp3+bCsCheTLstiQI48Fqw/YqSbWr64Ref5utc+hYJ86saTGsCVNThKU+KZ
	1iNTJpJYFYrVp6Ay9BCcz44tIy1ghrLpGbfEgsVXFeSkx5v49Dw01CFMt9FwvldJ5hCWwf+4g2v
	LqV4n4eSbd5u1D5/cu17sUO+QcuPuTZ8HOWPHDyO/A6RDuiYr+L15dl3xLwmEKH2dd/McItB8vQ
	/fnzS0HcfQk9YfKYcJO+QXSSOG64T70qw63zyhXRCpLjdmLPUJ7K5YVusr14bKWH9VZvYE4=
X-Google-Smtp-Source: AGHT+IFpm9FPdorY9p+7yFF0E/qPEvls81In4tlDGqWg/T6PfICbmWHMwTAi76ncXsNSZBlDznm7ew==
X-Received: by 2002:a05:6a00:2d8e:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-7489cfe84a0mr30513093b3a.20.1750313503735;
        Wed, 18 Jun 2025 23:11:43 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:9137:fb9b:67f2:dce4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecccesm12338252b3a.5.2025.06.18.23.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 23:11:43 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:41:40 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: marco@mebeim.net
CC: linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_RISC-V_32-bit_debug_builds_reach?=
 =?US-ASCII?Q?ing_breaking_point=3A_too_many_symbols?=
User-Agent: K-9 Mail for Android
Message-ID: <C90792F2-91C2-40DA-9C90-1602CFAC0FD1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marco,

Thanks for the quick reply =E2=80=94 and no worries about the dupe!

Got it=2E That makes sense=2E I was wondering if splitting earlier would h=
elp reduce linker overhead, but I see now that the =2Edwo files (or =2Edwp)=
 would likely still carry a heavy load and relocations would remain a bottl=
eneck=2E

Interesting to hear that the same behavior persists with LLVM =E2=80=94 I =
guess that confirms it's more of a fundamental tooling limit than a front-e=
nd quirk=2E

Appreciate your input! If I end up testing with smaller compilation units =
or tweaking DWARF emission flags, I=E2=80=99ll report back=2E

Best regards, =20
Abhigyan Ghosh =20
zsml=2Ezscript=2Eorg =20
@zscript=2Eteam=2Ezs
aghosh
