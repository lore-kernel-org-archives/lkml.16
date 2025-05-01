Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54E1F130E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109710; cv=none; b=tIOphA4liz7OJciLo1692Alr1+nUI+HH7Z87xMD70JPGWhIJPSI1/442xw2AAI2MGrc1dKqxQAb4+LUfRrCCIkL+c48vXnIKAMNfJ0uWE4OWMiRwGPbZp2gE20tHIyxE/Dkzegis/XBt9/PPEl8kc2DBVL3qu8VLP1DLQaZbfGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109710; c=relaxed/simple;
	bh=bsz764YfWE4MRTb/rqiHtlptyqwMLFB4ZEx+pwwq78M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oxNDHqAfOHwTDruVw8g2ZagAcSrpHSwxdSWTY6PJa74vj93BT93WtbHgunc3oLGaGT0BTnKP1iMiwu5cPwViMC+5OYzex63Wd/uynPr7I+IoqJuC56X+LZZnU3eLOUMg39hixuWQj7Az39VqpK7vYftBAwyHhp1Ur2Ggc+072TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=Nz18OdUV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="Nz18OdUV"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39149bccb69so672612f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1746109706; x=1746714506; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StVEjYMIl6wQyDKAupy/1mKYeucD0OYxvq84SFVjyeE=;
        b=Nz18OdUVPqtfO1CS81ZnZncxcGyeiNFrAzEeWVYMUMZXtJaVFIeU9ypYHo5k9OX9ka
         DH2Vq0YPwxNGy3ry5h0VrD5aUvwG0P5KggRCmQUAmpIurDioH/qiLuhuv9wLpvhps3SF
         q7IWQquVRvqH7uD7oZUkEbG3ZzGJ9gijK+xwPdn8ue4hXSfLmrx/VX7sKi6Pn0ANyKH0
         IznUj/vEXZd+STczZM8JmlO6JWHm/GIdDxp4u0pLkuoudBr3dBdQPrJRY0cudkdfxdPF
         n9r7pAPpEOQLYH7SDhBBjXCz1V/AUDZW2l9Wq5dR6kJQLZja5O1jNxu4m7YUDbGhYX1T
         Is5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109706; x=1746714506;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=StVEjYMIl6wQyDKAupy/1mKYeucD0OYxvq84SFVjyeE=;
        b=jqIixMpWl6Y9u5ro9T2nH8uslVbT0/WlHw1kCnehThOZ5W3wVujvUGU9+HYY8ahvmR
         FuqmMO75ZMz1dUPt2Lak1qY1TN0i/3MMk9tM+Jt47eZbbLZVl4EaKJAzlM2pIuv2f9W3
         nQzSdJJ8oFQN+DGvvvhvDCFsINAJ4fFO8ncepj5dS12yMbQDM1Gvs8Y6bvhx7L82Olgv
         H75XY+N09SShxBtQX8ozPH+l0WfMxKLeour8oLB3yoEVWcQASdVhSisdq+STqX6M5Q8a
         x8cVl1/jtZAvn4rKXfRwNEqcW9jwvoZPkbOFSkhrl/Zkarpyl3ryT6skjLMwAHDdRWbE
         D/4A==
X-Forwarded-Encrypted: i=1; AJvYcCX2aap/nJS5pOR/9JzohnGNc47pdXIYptrhap/RHV59rt6W6KbNf8J57UTwM4PdfP6t3wTUCjIlwSu7hfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YybIYKUIvW8C1a5SA6G/xm1ppnQb+lRFyl11URFYMKMmd/ijltK
	3auwTqSMySd9B+JmHrC0+hJL1TkiLEGlyJjnbDY9z9AYqzeOvXRFmD6ktXhR9iI=
X-Gm-Gg: ASbGncvSKlvU4Q1j6+Zly63y9BqDpVm6wuPtXHmMI5+s4Yvz6bhTqUy8J/Y43+8vzLZ
	Ur7xdRE0CRbjjJgT1hOPCsp1oHO3tA5kZ1Xg/tzA7fch6IBIaTVfKzKixfJiwXV/4zlEke1GSE0
	v7zT8+Sug+ip81DzA/68chUcrTTHm0289WdUURQl07jqmlAfVsk5oWhLxNiXBiMJhX1/1gmP1/F
	GL3hXaoH/E/w3woscbvUczWqqTaCchRwlI4L5kyYGkg02slyUYsDyu5IA4X+mYpxUyZSuW7K/2D
	u9AMQ44PsR+Jh4eMABfeZ/gq8TtZpvhOJQxO/hyc9UM1FxKN5AaRV08q4M5woXhhf/MF9TSHM76
	Hf2U8ppaFpnkgJQ5eyQvtpKKE5STMoq5hi2Jx
X-Google-Smtp-Source: AGHT+IEPSk+cQIgonsEsIg1aqlii+4w8mjQ/IOfqZ7nsCbNMR2MfqFqMDG1cn5sRDjMY3mVaDu76ig==
X-Received: by 2002:a5d:59af:0:b0:39c:1f11:bb2 with SMTP id ffacd0b85a97d-3a08f761da1mr6037739f8f.22.1746109706055;
        Thu, 01 May 2025 07:28:26 -0700 (PDT)
Received: from [192.168.1.240] (0.0.6.0.0.0.0.0.0.0.0.0.0.0.0.0.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:7a5a:26ff::600])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d15dasm13908445e9.16.2025.05.01.07.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:28:25 -0700 (PDT)
From: Lorenz Bauer <lmb@isovalent.com>
Subject: [PATCH bpf-next 0/2] Allow mmap of /sys/kernel/btf/vmlinux
Date: Thu, 01 May 2025 15:28:20 +0100
Message-Id: <20250501-vmlinux-mmap-v1-0-aa2724572598@isovalent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASFE2gC/x3MQQqAIBBA0avErBtQwxZdJVqUjTWQJloiRHdPW
 r7F/w8kikwJhuaBSJkTn75Ctg2YffYbIa/VoITSQguJ2R3s74LOzQEVGa37znRkJdQkRLJc/t0
 IS7DoqVwwve8HbY5dLmgAAAA=
X-Change-ID: 20250501-vmlinux-mmap-2ec5563c3ef1
To: Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Lorenz Bauer <lmb@isovalent.com>
X-Mailer: b4 0.14.2

I'd like to cut down the memory usage of parsing vmlinux BTF in ebpf-go.
With some upcoming changes the library is sitting at 5MiB for a parse.
Most of that memory is simply copying the BTF blob into user space.
By allowing vmlinux BTF to be mmapped read-only into user space I can
cut memory usage by about 75%.

Signed-off-by: Lorenz Bauer <lmb@isovalent.com>
---
Lorenz Bauer (2):
      btf: allow mmap of vmlinux btf
      selftests: bpf: add a test for mmapable vmlinux BTF

 include/asm-generic/vmlinux.lds.h                  |  3 +-
 kernel/bpf/sysfs_btf.c                             | 25 ++++++-
 tools/testing/selftests/bpf/prog_tests/btf_sysfs.c | 79 ++++++++++++++++++++++
 3 files changed, 104 insertions(+), 3 deletions(-)
---
base-commit: 38d976c32d85ef12dcd2b8a231196f7049548477
change-id: 20250501-vmlinux-mmap-2ec5563c3ef1

Best regards,
-- 
Lorenz Bauer <lmb@isovalent.com>

