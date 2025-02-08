Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32794244E88;
	Sat,  8 Feb 2025 21:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739051172; cv=none; b=p9ihApAflVvdyuLq9J9BWovDmpm9Xy9tS79FqSkvKEz9J3d0LwNo4/tXFQJ0NyBu9Js9W3J1HkIdn/a1ikZjtu7vCJzZfLsR3F1A07DU8CJ5zZB0xH/Q2C9cpzx+19bV4T+wtzfi/PHGWCP51uxOGEcWMjukg8gODymxbq0onjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739051172; c=relaxed/simple;
	bh=SMND05RPncMtiZ4/MyPVjY5pd73ZO4ny/7/x4/mq+yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WbQtvoKTQZhz/CJeXUJUROpCLKXv4TUyNvW6GpEN1kqIbTrtU7WW3B5Smv4sSOcqz8jzwbIG2uc5/9PLQxdFLIKLlViYsqSsAdOpLyp4rwmh3maR/fWxNbPr/kNnrdH9cE0iA9jp4so3v2Q6nJDu0OjC8nXvrESlGl8zUNozD6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFtXqrTm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFtXqrTm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7430e27b2so611334566b.3;
        Sat, 08 Feb 2025 13:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739051169; x=1739655969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVLdqw1wzF89QzGGVuAmcP25AG0o0ymCna7D+COF17c=;
        b=IFtXqrTmDrBcTYD8oXDwTg2cbVGwGm1s2M3JNi6n4m6F47z5+lAKfVAROpYstKRAjV
         9hF2CvfXEU2/dLhOcXm0hiVHFeyz+nA8q8aEunDYmkmfri52fgB6x3y63+hJPQCMWk62
         RvPSaxeYLNZc0pi3au/8xqWm5a4RGiPi568a2517v8LrQPKZQd5NiFcJBG/PZhJpSD1F
         pcFIHqcU0GQgJ5LYjzPGNEOCAMi78UYRD6svUryiwilnAENPbEjwbXUUYGT+v+pSoZK9
         13sLssKlZQcKLKCmHbUmGbZtwQNtpM483PIrew+dcjWb3NnG1J6TYjbrDIJVEK3+seHT
         4sNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739051169; x=1739655969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVLdqw1wzF89QzGGVuAmcP25AG0o0ymCna7D+COF17c=;
        b=UBj9+T+pumF9LD/qly2yZyGEfMg8MNkJK7fyRY64UvauOgmbXaUCFd0b8Gyl9NzX/X
         gW5ZE9eDUfqhe6tH3xk8FD3kb6bNGteHFgG22krhj1hI66tvXNlzPwgXawgbUvlNBHIa
         VD3zJi1y+99SOa262z0tB+7EZFza8Ah4bFE+4/R3EhUbMr8keU6lPDQExLl6fLIA1BMF
         lAXgjoL5fAQSU8Dtg42BlIsvWZC38G/c3dIpzBYTkdNP0Oiib5KrXngDnfdHnGlHx5PY
         qOZQF2wLu3Mhw4DPvhEwQMHy8Da1peOiFyEynxIHJVWbI4oIh7y4fwc2WtN2FpenJU03
         YXgw==
X-Forwarded-Encrypted: i=1; AJvYcCUOeEfaGp7fmlv+muslVk9dd4xrEv7ZwVkcl1J1ugl19FKBZlkE2NA4JE5cx/SeVAHkoT5qXBTLP1Sdw4w=@vger.kernel.org, AJvYcCVituXcsnuQUf6QkBsYWMUpskXdFXU9k0gT8vEMv0285ScsVgaUwMuwOMo6HhjbXkX9GoPcFrusobDLWKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzCCptOrDvP+7p0O36YOG6l3IhEyQuJWiuA89hYi8RKIc9deJm
	z27ltcU4QpwvFQfqiGKFtQg6TDU465QOyntuB9sXdN7X205xIObG
X-Gm-Gg: ASbGncu+ULoL3pmqkTA2/HmyWydJkhRFYzWQf+9FVl0ZMUSNG2wW6BqjQoX3L6ZZQtD
	wg0BSy4HUfGXsdhEhQseCrcSmrgWwfV5MXwOSDerJVpWQaXcwBiodyoRlGBoRtftpDxSm5VqeNJ
	G/AX3QK6eFFjv1iq+L3nPe9LUZMsF5VmGJqTMM959+PMiUqV7IcwjZWpZstELvlJOYdWAyFAycg
	VmIHIN4F7Dp3pfufnofZKfcOmRT8Lk+bOsPjmJ4Cx9CFdcDL22mD6uIJU5vqI0zL4atgQhqe28m
	7ueZKAZPbFzH3Y8olIOsjG54FBK9VQ==
X-Google-Smtp-Source: AGHT+IEPMtIrMo3gkig+RsiKk59Obs84cg+Mfw8rg53UfvUHWieXEZYNk+OHKZHL1+E6Ne3kep1zow==
X-Received: by 2002:a17:907:7e97:b0:ab6:de35:730a with SMTP id a640c23a62f3a-ab789a9ebc9mr862956066b.8.1739051169153;
        Sat, 08 Feb 2025 13:46:09 -0800 (PST)
Received: from localhost (20.tor-exit.nothingtohide.nl. [192.42.116.217])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dcf9f6c77esm5013221a12.69.2025.02.08.13.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 13:46:08 -0800 (PST)
From: Maxim Mikityanskiy <maxtram95@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	WangYuli <wangyuli@uniontech.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v2 0/2] Fix Optimus when GPU has no sound
Date: Sat,  8 Feb 2025 23:46:00 +0200
Message-ID: <20250208214602.39607-1-maxtram95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See the commit descriptions.

As agreed in the previous discussion [1], this series adds the
non-functional NVIDIA HDA controller on Lenovo IdeaPad Z570 to the
denylist, and includes the runtime PM workaround from v1, which now
prints a warning to dmesg asking the user to add the device to the
denylist if it's affected and not already there.

[1]: https://lore.kernel.org/linux-sound/877catiffo.wl-tiwai@suse.de/

Maxim Mikityanskiy (2):
  ALSA: hda: intel: Fix Optimus when GPU has no sound
  ALSA: hda: intel: Add Lenovo IdeaPad Z570 to probe denylist

 sound/pci/hda/hda_intel.c | 44 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

-- 
2.43.0

