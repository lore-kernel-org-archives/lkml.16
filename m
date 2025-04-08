Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A749C207E14
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111369; cv=none; b=d464NChrovWS5P0T5bbJ/JQ8s4hCIVk54g88TjfExRlwvxjo68JLsX98f/jB/T3IEExEB2ELDJuylkx3OsaQBnWaVRAw0JON5A7kt5sHZ0wJ7hVBH2A9DrhHjNhlvVOywuP4OYwjrFIshMX9ioBsbfcXgb2sQtiaWjo6r0xOKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111369; c=relaxed/simple;
	bh=scekJsPgdNGV+VcRQzth9B1JgL6BZGvs5wynfSwMrd0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eLfrTND5WBpu6aAFaUNZ11jSwzhIdbXgevSAlDtLJ3OJAKwJ35MT9mhv/qQjbwCOW73iG3gyaG2MCUZza2MHhq3L2FdWgwp9JaSiVy9oEB3FL67YzEcpkCITdHYaALBc+1ELX0PvlcrJXbWxMgE8/1lofLzq+UOd6WATTtFa2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2d71d86; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2d71d86"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af579e46b5dso3501333a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744111367; x=1744716167; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3LUESUy2O30c1zhmsWM2+07t2Tj4tuMSWNkW2oLjVdI=;
        b=F2d71d86tPNz8fcGQ2n9uZ+FWwmUAYeeHWngfT1+L1sN4Ns4HwbvIT0ErwF0NM7H+m
         Bgqksr5jOeAvBglx8fn++ggX7KRkMDG3b+/KcVic2x1QlarzHGYa3fetKMu+xtPpFSPs
         ga5dMGAEoRg7BlOyh/DSWdJSyzLD5XxL+LDm9Aj3RacgjqFldt+mk5UhMkshBxeyduSu
         HGi+72TngKG0FQiBi1gE1eYvSn57jhGWMPESHBbc3s6eS1KuxcH2WTIaTvzDdogovGzS
         yAMxOBcIVU8L7GLxm7T2Lc/SRMswyzUuYIbGBWpWFg+ISinXUxEOuwKdH0SLPBEx5j0C
         30Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111367; x=1744716167;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LUESUy2O30c1zhmsWM2+07t2Tj4tuMSWNkW2oLjVdI=;
        b=EEBcawBlMMJV/WSHKgneW3WsQptmxZ70bbd7E+U+inAyhWDwp7mPRpmUGH82O6CLvi
         h6HcKn8wknB+TX8ZsB9cwgP/ZoY3L1RGcOLBzb5XpioATNY6W8q4AHLB/vkG0jEm6Gey
         NU0uD6d5pvvy/vFfc8A/kBH4ddSLoFNggq7aQ1JcxwjnCPCwUfzOSXr0Gk9VBRVBv6R+
         aGvXlJOdZ/IroExlrKQhwTFiBmcL8dakP5hDM0gdBlfQjipR36HUkR1PyCoWMSxxdrDy
         aSyLRjiB7MhO1W1geLiY/EnOTBFyrCEpX/rLLLDdYR1H5E4NOZA7ifh1AqNI6IhkHnUr
         MYQw==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZwBDwrRmDkmwhw1UnF4PFKW4Q3zaIdWlkgO2UMf7IKef4PG3F/JkWzFOMxjmaiLkS04t4EV81pEVoU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycff8HhN6Z3jb/QWaUiOZF8vCE6ge6n+Vu9pdRnQfnUxNEAXO6
	lKX8wsTqDaQAl6wfAU72jhuvUqwmsk5/gCJNdHIdH3m3MFRae8rPmJ8QdgGJqciDe8ffkvi2nNS
	MZzhWe0HT+eNs0fQ0qDMb6r6fNBQ=
X-Gm-Gg: ASbGncuVBozrlIDWWIln8UDtUeT6DEpk9a1KEj1VSy8q9gFapNTyLhvC0wsuxC4ouSH
	+DKxxS3pLQNVmvCo0SnpoYxZSSwe93UTXFxQgDkhJIj9RkSZg/2MVtI67NbVqV8uh/zUNu1shD0
	2+C5UzCHApHdvvrExrac7zEZll+A==
X-Google-Smtp-Source: AGHT+IEVBzWQb/TBG5ZzSO4G1dI+tRUKz5kA1w2nTxL3l1uKDSw5KbzYyKr1IcYi19oMdtZYUuP4d5Pmg2ZuWeJr0zA=
X-Received: by 2002:a17:90b:2710:b0:2ee:741c:e9f4 with SMTP id
 98e67ed59e1d1-306a615018dmr21834042a91.11.1744111366715; Tue, 08 Apr 2025
 04:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Tue, 8 Apr 2025 06:22:10 -0500
X-Gm-Features: ATxdqUE4LG3fyLaMSvlsnqA6sUYEOZzZ0jaR3X2ZJMEQ5fcRTxjZgkXMsNclq7U
Message-ID: <CALaQ_hrJC07E3vL9PE+JusgLZvxwcBFC89P8HzyT42NjC2pYDg@mail.gmail.com>
Subject: "BC" Failure When Using "POSIXLY_CORRECT" Environment Variable
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

When the "POSIXLY_CORRECT" variable is `unset`, the build continues.
bc.1 man:
*****
       -s, --standard
             Process exactly the POSIX bc language.
      POSIXLY_CORRECT
             This is the same as the -s option.
*****

Failure output:
*****
<...>
make -f /<pathTo>/scripts/Makefile.build obj=. prepare
set -e; mkdir -p include/generated/; trap "rm -f
include/generated/.tmp_timeconst.h" EXIT; { echo 100 | bc -q
/<pathTo>/kernel/time/timeconst.bc; } >
include/generated/.tmp_timeconst.h; if [ ! -r
include/generated/timeconst.h ] || ! cmp -s
include/generated/timeconst.h include/generated/.tmp_timeconst.h; then
: '  UPD     include/generated/timeconst.h'; mv -f
include/generated/.tmp_timeconst.h include/generated/timeconst.h; fi
/<pathTo>/kernel/time/timeconst.bc 6: Error: multiple letter name - gcd
/<pathTo>/kernel/time/timeconst.bc 12: Error: return expression
requires parenthesis
/<pathTo>/kernel/time/timeconst.bc 17: Error: multiple letter name - fmul
/<pathTo>/kernel/time/timeconst.bc 17: Error: return expression
requires parenthesis
/<pathTo>/kernel/time/timeconst.bc 23: Error: multiple letter name - fadj
/<pathTo>/kernel/time/timeconst.bc 24: Error: multiple letter name - gcd
/<pathTo>/kernel/time/timeconst.bc 26: Error: return expression
requires parenthesis
/<pathTo>/kernel/time/timeconst.bc 34: Error: multiple letter name - fmuls
/<pathTo>/kernel/time/timeconst.bc 36: Error: multiple letter name - fmul
/<pathTo>/kernel/time/timeconst.bc 38: Error: newline not allowed
/<pathTo>/kernel/time/timeconst.bc 38: Error: return expression
requires parenthesis
/<pathTo>/kernel/time/timeconst.bc 40: Error: return expression
requires parenthesis
/<pathTo>/kernel/time/timeconst.bc 43: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 44: Error: multiple letter name - timeconst
/<pathTo>/kernel/time/timeconst.bc 44: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 45: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 45: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 46: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 48: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 49: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 51: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 52: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 54: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 54: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 55: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 56: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 58: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 59: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 60: Error: else clause in if statement
/<pathTo>/kernel/time/timeconst.bc 61: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 61: Error: multiple letter name - fmuls
/<pathTo>/kernel/time/timeconst.bc 63: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 63: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 63: Error: multiple letter name - fmul
/<pathTo>/kernel/time/timeconst.bc 64: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 64: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 64: Error: multiple letter name - fadj
/<pathTo>/kernel/time/timeconst.bc 66: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 68: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 68: Error: multiple letter name - fmuls
/<pathTo>/kernel/time/timeconst.bc 70: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 70: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 70: Error: multiple letter name - fmul
/<pathTo>/kernel/time/timeconst.bc 71: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 71: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 71: Error: multiple letter name - fadj
/<pathTo>/kernel/time/timeconst.bc 73: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 76: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 76: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 76: Error: multiple letter name - gcd
/<pathTo>/kernel/time/timeconst.bc 77: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 77: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 78: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 78: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 78: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 79: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 79: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 79: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 80: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 80: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 81: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 83: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 83: Error: multiple letter name - fmuls
/<pathTo>/kernel/time/timeconst.bc 85: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 85: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 85: Error: multiple letter name - fmul
/<pathTo>/kernel/time/timeconst.bc 86: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 86: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 86: Error: multiple letter name - fadj
/<pathTo>/kernel/time/timeconst.bc 88: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 90: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 90: Error: multiple letter name - fmuls
/<pathTo>/kernel/time/timeconst.bc 92: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 92: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 92: Error: multiple letter name - fmul
/<pathTo>/kernel/time/timeconst.bc 93: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 93: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 93: Error: multiple letter name - fadj
/<pathTo>/kernel/time/timeconst.bc 95: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 98: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 98: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 98: Error: multiple letter name - gcd
/<pathTo>/kernel/time/timeconst.bc 99: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 99: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 100: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 100: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 100: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 101: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 101: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 101: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 102: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 102: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 104: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 104: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 104: Error: multiple letter name - gcd
/<pathTo>/kernel/time/timeconst.bc 105: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 105: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 106: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 106: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 106: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 107: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 107: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 107: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 108: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 108: Error: multiple letter name - cd
/<pathTo>/kernel/time/timeconst.bc 109: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 111: Error: print statement
/<pathTo>/kernel/time/timeconst.bc 116: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 116: Error: read function
/<pathTo>/kernel/time/timeconst.bc 117: Error: multiple letter name - hz
/<pathTo>/kernel/time/timeconst.bc 117: Error: multiple letter name - timeconst
set -e; mkdir -p include/generated/; trap "rm -f
include/generated/.tmp_bounds.h" EXIT; {        echo "#ifndef
__LINUX_BOUNDS_H__"; echo "#define __LINUX_BOUNDS_H__"; echo "/*";
echo " * DO NOT MODIFY."; echo " *"; echo " * This file was generated
by Kbuild"; echo " */"; echo ""; sed -ne
's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:;
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\)
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < kernel/bounds.s; echo
""; echo "#endif"; } > include/generated/.tmp_bounds.h; if [ ! -r
include/generated/bounds.h ] || ! cmp -s include/generated/bounds.h
include/generated/.tmp_bounds.h; then : '  UPD
include/generated/bounds.h'; mv -f include/generated/.tmp_bounds.h
include/generated/bounds.h; fi
# CC      arch/arm/kernel/asm-offsets.s
  /<pathTo>/toolchain/bin/clang
-Wp,-MMD,arch/arm/kernel/.asm-offsets.s.d -nostdinc
-I/<pathTo>/arch/arm/include -I./arch/arm/include/generated
-I/<pathTo>/include -I./include -I/<pathTo>/arch/arm/include/uapi
-I./arch/arm/include/generated/uapi -I/<pathTo>/include/uapi
-I./include/generated/uapi -include
/<pathTo>/include/linux/compiler-version.h -include
/<pathTo>/include/linux/kconfig.h -include
/<pathTo>/include/linux/compiler_types.h -D__KERNEL__
--target=arm-linux-gnueabi -fintegrated-as
-Werror=unknown-warning-option -Werror=ignored-optimization-argument
-Werror=option-ignored -Werror=unused-command-line-argument
-mlittle-endian -D__LINUX_ARM_ARCH__=6 -ffile-prefix-map=/<pathTo>/=
-std=gnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE
-fno-strict-aliasing -fno-dwarf2-cfi-asm -mtp=cp15 -mabi=aapcs-linux
-mfpu=vfp -funwind-tables -meabi gnu -Wa,-W -march=armv6k
-mtune=arm1136j-s -msoft-float -Uarm -fno-delete-null-pointer-checks
-Os -fstack-protector-strong -ftrivial-auto-var-init=zero -pg
-fstrict-flex-arrays=3 -fno-strict-overflow -fno-stack-check -Wall
-Wundef -Werror=implicit-function-declaration -Werror=implicit-int
-Werror=return-type -Werror=strict-prototypes -Wno-format-security
-Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member
-Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=1024
-Wno-gnu -Wno-format-overflow-non-kprintf
-Wno-format-truncation-non-kprintf -Wvla -Wno-pointer-sign
-Wcast-function-type -Wimplicit-fallthrough -Werror=date-time
-Werror=incompatible-pointer-types -Wenum-conversion -Wextra -Wunused
-Wno-unused-but-set-variable -Wno-unused-const-variable
-Wno-format-overflow -Wno-override-init -Wno-pointer-to-enum-cast
-Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access
-Wno-enum-compare-conditional -Wno-missing-field-initializers
-Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion
-Wno-sign-compare -Wno-unused-parameter -I/<pathTo>/. -I.
-DKBUILD_MODFILE='"./asm-offsets"' -DKBUILD_BASENAME='"asm_offsets"'
-DKBUILD_MODNAME='"asm_offsets"' -D__KBUILD_MODNAME=kmod_asm_offsets
-fverbose-asm -S -o arch/arm/kernel/asm-offsets.s
/<pathTo>/arch/arm/kernel/asm-offsets.c
In file included from /<pathTo>/arch/arm/kernel/asm-offsets.c:12:
In file included from /<pathTo>/include/linux/mm.h:7:
In file included from /<pathTo>/include/linux/gfp.h:7:
In file included from /<pathTo>/include/linux/mmzone.h:22:
In file included from /<pathTo>/include/linux/mm_types.h:16:
In file included from /<pathTo>/include/linux/uprobes.h:18:
In file included from /<pathTo>/include/linux/timer.h:6:
In file included from /<pathTo>/include/linux/ktime.h:25:
In file included from /<pathTo>/include/linux/jiffies.h:14:
./include/generated/timeconst.h:1:1: error: expected identifier or '('
    1 | 100
      | ^
<...>
*****
