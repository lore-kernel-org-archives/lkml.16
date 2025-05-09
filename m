Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36415A921
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803400; cv=none; b=Ats3XMlDSBE5vVBFfFLVpwDOXdN4U7t1J/0nFaO1iUyl15FJZQ1b1wnTq6Ol3QQ9VLLgEnkeEaHAse5T7EDm5wxDjTdiBsK/eIdZGdMfWmPFs98+FijTkLcUIewsrCS2x+He4FyXKlJeqHdnB18VNMW3/4cGG0a4xKogeYW64Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803400; c=relaxed/simple;
	bh=0raLsyvmspZO8KIh4Qq2YkCiCP1OpO5e3/Ms4xo0uMU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=N2TIKzTJrwl3bCnuyklS15eYSTj9ycUJ7MKzfpPZiYpzsdHti1/9APXYOXLC5ggtilbIreNQ8RxifMhJ9NBlDzqJPCxb513Ua4A2d9AoXZWLqHcvn0ZYL81505ebvdcayNlJXffhvmzsCIYG/GULolFU0m6QTeqzPQPUjKU73LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M20AqgXm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M20AqgXm"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso398646966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746803396; x=1747408196; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtXiKhyTTbKRLQNr8fessPI0nm/AMjfgZ5fWE4GnCgU=;
        b=M20AqgXmsAmCMBOJZvtASPR3Q8vdVZbJ8FJNp7m/ICFs3oQhgRrR330u1nBoRXsJd6
         VExP9Slac3NC4E1MOWhPDb82G3dyQnKi2YF0yiWMcfw8bI7rBXAPc2t1OrLrocsOEaCN
         KRFJVSBvJsNzIstgH4RETK6K79GyiZTPfcqkeu1Ns0Wp9IIjxG26s85ZOJhBlav91n7Z
         BPl9tf3NOHE7/FOL70kmPjGj6NHltgQBH5U5lh7t5bbQtZ0Ez0ntPlwZV2Kb5YifBh7S
         N91nFHwHX3naykn0fUIDSG5+ucvjst1Wo0HxsC5lxJ7skeXL+vdH3SvYtv0rYYZ3QQ1w
         ZHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746803396; x=1747408196;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtXiKhyTTbKRLQNr8fessPI0nm/AMjfgZ5fWE4GnCgU=;
        b=HYQIZnQRoCOmxl1UdCftHCjzIR+Cb9QjkotqOwXjaQ9wJAZKy/pVjeJEeVotggYPvi
         92mrnWUrthmxLCwyVgKfhSdKae5WTSnI/xaiXS+us7xGmsai+LwZWRXZtvdixBpHYkMC
         o3F4CUyLzTdmSzpBP7d9X09gAL3C2u41G0LQ8gEQA1blMMaDBKtUZiBDV6iWdie+FNfm
         f7d1cmSMDP5MZ6D7U8SexqWBEgn+moMbeEV+5PFslKvpic0hxis3v7hmMrz0n3dKaSKc
         QRvorBMc/TbSEU/SzK/OhizLTwHmVuVQeSQlQzZja/MFjteOQYkcuMz3jmOtEUkg4UzC
         qjHA==
X-Forwarded-Encrypted: i=1; AJvYcCWlJnb6LRvsZOoxMmpKpTHQwTGzGQ6OxUCz6GDK8GBAZkr17VTQ0BTozDr1JUPnq/I0MSLagXUbdr+kwqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9BT/hqhWoh623i8OpHo3xd8m7vaPVxMkDCLNaff+Uq4svhfzM
	tGrCzgkJh6KuSOPp331XxAAysAdDNTenFCwyv8WShkTp55RceFP55blk7Ci1V1M=
X-Gm-Gg: ASbGnctoIGLSnMhED++UtbrdezbnfNbyIu1UbQIwC95z4zlj+SS9SHqcq9Npp3E1nDr
	S32gTuq7HiQrcmfbOuZ995469CDaFQgswsS04Xo/VFQnoEaXlOb3zPRA9Z75yBEPsFB50k3G0cM
	Z9c1cc3RZ1jytz5RetkbktsOkemkSYPvgm4VhLX7qHcUmg8jBFnekKenls1g/jOf2QlkWm8yeaE
	B++tOrWH3AyYPclLE63kD/zniCrwIR4Nx/rHdgxrXQqTz+GTM5ibOYsaHpqkWkE/jIJkzP3FAZ9
	4NTytDfcu9LKtMwniPuOtQzg87YMGZHRHJWh2v6HUn4=
X-Google-Smtp-Source: AGHT+IHcnFBxME8/PbbpkOaUefPkHynw9shIy4X2lxZw57yC0g7k6KUCMMkKDMKsDoJWYa7NGmZS7Q==
X-Received: by 2002:a17:906:c102:b0:ad0:688e:57d5 with SMTP id a640c23a62f3a-ad21917102cmr352225766b.44.1746803396346;
        Fri, 09 May 2025 08:09:56 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192d4a1dsm165870666b.17.2025.05.09.08.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:09:55 -0700 (PDT)
Message-ID: <0e82be0f-a305-4aba-b9ab-79596f595277@suse.com>
Date: Fri, 9 May 2025 17:09:54 +0200
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
 linux-kernel@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
From: Petr Pavlu <petr.pavlu@suse.com>
Subject: [GIT PULL] Modules fixes for v6.15-rc6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/ tags/modules-6.15-rc6

for you to fetch changes up to a6aeb739974ec73e5217c75a7c008a688d3d5cf1:

  module: ensure that kobject_put() is safe for module type kobjects (2025-05-07 20:24:59 +0200)

----------------------------------------------------------------
Modules fixes for v6.15-rc6

A single fix to prevent use of an uninitialized completion pointer when
releasing a module_kobject in specific situations.

This addresses a latent bug exposed by commit f95bbfe18512 ("drivers: base:
handle module_kobject creation"), which was merged in 6.15-rc5. The fix has
been on modules-next only since yesterday but should be safe.

----------------------------------------------------------------
Dmitry Antipov (1):
      module: ensure that kobject_put() is safe for module type kobjects

 kernel/params.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
