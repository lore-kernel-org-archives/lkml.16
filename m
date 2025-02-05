Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1291D5159
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720225; cv=none; b=sypsohPsKOOgSLFKkjZ5OXQAQwTSdtOyjRkBiV4zN9YaFaJiQqqX0bmVcfPNjXShSHFV7w1nlDs/FPIRcM65D184auMhl7vw2huuHN63eIe7PedDsbDxEgTyTh6t2DIWt7/bOuvEUYRXKsbkeq6UTQdt6xpV7/18xekFXCENdDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720225; c=relaxed/simple;
	bh=K9hxSsEjSuskwWFMkKzx4jKm8OUSEZdzQCDUXELwr04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACYziARu6pPNoc7eB3uA1IL/bjSZ2ycUycpp7ZDw8TrXNcovZYdsKcHd99pCGaHZcH/RTXNZobbXYx96Uhvjjvy7QAb56EwC015HLZSe/fyyGhU9PEk0/+5tIhNIkeN88DTpNEo3P0YQaSzdQPEhffUEu6x6TKXC1JoHDH5Qxwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5X+gbnW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5X+gbnW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f9d17ac130so1446574a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720224; x=1739325024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1OcDg/OtmqKUQjN5TPuHo6tEG6KgsPyO8kgM3y+rLw=;
        b=S5X+gbnWYSzj4oGbk9dgfEpNc95gqMoRcEIZ9gQV7iWo27Pnfnd9FvfuKHuwuIjhrD
         dIuW49eiqlagXpU4f84/TuIjc4FTOx/J3KzdVnKo3+OI8MbV7/kySVgRrEf76yYRcFiq
         DjOYRR44nLPJJ2l9zrkzWoPv3eFSGmJQU+z6OwAYhrWgg9y4OdLh5/MAbQJbXBI7xVyf
         vLIVMhP6coAM6Xgr2RSR0yH9Vb885aU+By8n2ufoAVqDrpIfkhP0UT1hJr2nFi8V9UQc
         HXrRVOabX4qyqfcv4pXob1pg6vhgUi4tQCcmlaSqMm+wqnP0lsfa8xFel2K1zkZSrP7y
         +o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720224; x=1739325024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1OcDg/OtmqKUQjN5TPuHo6tEG6KgsPyO8kgM3y+rLw=;
        b=KgngGF9N/yElNA+NeGNZn8SurULdbO6R0BlbgGVZyOA6NnQVmgfPA50o3EdAbFIPfK
         qj8j+x6L+WuAtpbuWt+4/cMfWrmogO20fexY3AZqjCGqAE0UeB03fKrXaoeUqsJA3yQH
         u2Ij9hfh/POTAPemtn4s0Bm3pEJrhvakl7u1qz5zdT9NzFr/CDNlW6W+z9JyMy1Pvxbi
         W/DAnVqqhAVMdI9lB9yenTJuHcQH82UzlOAhw93/f3j/2uLze7rfhZdX765dFUaXlS06
         EAgvVOxoDsBIPbJga+O7m3sjvUB8WFj2QPsQt0pnY+kQ3lPHsmOkZVQ2CZRifpP0SFVz
         Qa9w==
X-Forwarded-Encrypted: i=1; AJvYcCX34N2lg1QpP+XPUFcZFbR9Gd9UU34yG5rddtsuypRc8CINkaR3xz8QHcM8nygKkUzfnqK3LIQnogqLYqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySZcMZEj2nQs2FXN3TAd5u1FxX2ou0M+pYiYIRilcFUruuIedz
	c7BGp2EXRgCWzCOMYCo3XWbg3wDbCHeMn0hRupw13XktSoW5qkrI
X-Gm-Gg: ASbGncvbUqs8s4MWzoozh1kMI8sUkH+s7uxfOZDGmb+fPSufY5FlyNKaz/YeVujz/io
	CJ7+niaSAWdcQlM9qO0cvAFQsNawQkj2CNywPiFHc+Rj6FatL/UVAoBme/3n1nsBG8S2K+y6DDk
	DVjQQDQLsCvPFmYFijov4xNBEK/QNY0dT3QLKcNPHnyrk6YfEbQ8Lxzpf1MpSGOUckpBi6oXaer
	MQtIV3HQl1LOAGFDEtpI2o8UQwC59CYh66yoxqXWZB8BaSep2nxK1COQqzl9hh8xuHWYKJcMSli
	gKjqgeU0zaBLJM8lWksqbpY=
X-Google-Smtp-Source: AGHT+IFCAGleu6WkioicbkUSBZwe556ET0Z4I48nSwszR+JcvZnWXVP0Eiky+UvJtetkrpbG3LwuUQ==
X-Received: by 2002:a05:6a00:28cc:b0:725:f1b1:cbc5 with SMTP id d2e1a72fcca58-730350f96demr2106073b3a.3.1738720223589;
        Tue, 04 Feb 2025 17:50:23 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631c02esm11263939b3a.31.2025.02.04.17.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:23 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/4] Code style cleanup
Date: Tue,  4 Feb 2025 17:50:15 -0800
Message-ID: <cover.1738720049.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch checks and warnings were cleaned up.

Ian To (4):
  staging: rtl8723bs: remove unnecessary parentheses
  staging: rtl8723bs: break up long lines
  staging: rtl8723bs: fix spacing issues
  staging: rtl8723bs: fixed comment styling

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 475 +++++++++++-----------
 1 file changed, 244 insertions(+), 231 deletions(-)

-- 
2.45.3

