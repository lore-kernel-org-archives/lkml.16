Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC77F4A07;
	Wed, 23 Apr 2025 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443380; cv=none; b=RStT7q1htwwBGjQfUP6IgMSzcNmuBlY5/SXaG/TCgGPbgqRT8fKULsbMwqX4MKyuwpms5ygWfeIb1C1kH5xJQv4TdxZDiZR97z/Vhi3KO5eD5YSjY+7cOIEXjNswX5g5vEiywOTsNSrtEAibwH+NXjHpJ65EEphdAH9bHil/WlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443380; c=relaxed/simple;
	bh=vroXdEXGSwCW/w5y7X8aHiA8wcGGNw514c+NCSaaK5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ULkN0G12mZijdvjDE6JsvaJhNaQPR8a9Zaomm4WvmayDfS3l9ZeNGN8a2DH5zjwEAEcsdZJ0F1uo3kJYk7/XksSmE3c+nIdYyWtDZU29JOBH6oqYSq8X+/9BenVdMTW1cV3xDCvP8nRy5c8BpJaWQjxHTqhERlP7Q+YNVUXcYBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxW+H3aA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxW+H3aA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso181538f8f.2;
        Wed, 23 Apr 2025 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745443377; x=1746048177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vroXdEXGSwCW/w5y7X8aHiA8wcGGNw514c+NCSaaK5I=;
        b=MxW+H3aAdoGm1f+z+fc82pvpQB882qiIDI2wmMX2FJjg5YkFUJJ7XF+iGGPPiMEOnP
         ucM8zMk/8Zv51DxBanjJNUhQ41tdTGpxnRTbgmDTkQBfoB7nKoNANnTd0NxPGj2rwdDx
         2rfTbhfpabMENR8XmDeZKM40SR/ZD8dJWukf4LbH8qBsa2UcyzSrh5+5DpVQYBibLmJc
         lX541l6ZS4JM6Z4WD/wXIR7qDpa+w2cu72agImy3lqALsftzCLl1PTrMYDLZEQxjlL5c
         B6sCJktRSZnXA+nNcIW5gyXuCzQaP8tmS+zBwn15ljb9BycIg0yixkhYSAep7SAQHKBf
         0ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443377; x=1746048177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vroXdEXGSwCW/w5y7X8aHiA8wcGGNw514c+NCSaaK5I=;
        b=F0ShXaY5n7+5dqVO/LHW6gW0soH6dwHQTQeFW2gGnLYFgUCT7YGGAPiwi9NKNFuhbW
         bjRqJf9YWhEJk9g2cY/4jORbwFi8yD+7T5UZcrj3j3zuKnSvZ/SLwVhadHBDYzXGwO0U
         BWjDFcvUCQnKGxi7Bir7FjrAZW4r8PiSN1FuJBp1trqLsHeue6AdbjN7TFZvvwXIZoQs
         Hu2yVYKeeFkMYuuN2aT+crEOKi+sYRyBriWb28SPTy1+fGq5+wqiDhBxkgeeVf5ya4RR
         rPeXeV5VYNBFgjaWmQ2d1z8yxnL2h84iVtSvQthEg8OPB+yULxPeeOwAsm4wQmZKppFR
         C7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW50uUFKubwklMTlKNiz50Nizjetm0zcVOlefQd2ANRUDJYgjSBMS5Ptf19pbh9d9VNBoFpbc6vcaMw6E5K60jEoT4=@vger.kernel.org, AJvYcCXlPQWU899KpUIbOIYrE7bZB8sok4F1eIfjNvkxbOFJRkRNfA0maPZHEkV5PtA/b8VKchOv/WY8IlUcrM6n@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBqHKgzLMOQi98lqWeK6PsynreijE9/wW9C4DhDX6g1PSLPDO
	FR4GYoycXlsGB1zbo+jH/q4RbWkcdUSL6YXfgyE39r9uP+Ml30jFVZ7nIA==
X-Gm-Gg: ASbGncuJEtPAoHbcIHEzOLvRenPSHZY9d+9PSAz97xzS0PKJ+PE9/RVE9ZuYYTjlAv1
	SV5ltm3H3vE+oMjVp6VhhNUFqzpKyDBF9eNDtZtp50qZwN9fbpKDhrUd5NpV7njWkXFzxnu+SbE
	tl9YN3kuDYA7txUmyUTLY0400kEQfC8dwbt8GRFyUgr4TZ7hh8zzJpvU5o+mGns2Del21GKpNrb
	QwZgLNEv9yhOmbpYkUhzwH4aSM0EtyDGgXWTVspAfKKp0EVVnsop/BjVUdfdttoKN1tASgL8HVH
	bCguObhhOEYeBUcHh5eSNMImuEpINkl+s5lpbb5E2GpWLanoyvqQPod0IY5OKZEdaVu3Sv4weeT
	nkyGBme6oALrZ
X-Google-Smtp-Source: AGHT+IECFVkOBd2mo6L+/I5BHBZdo1E1vmaBdbSkSzj4i7L8WL+xukJgc2BntF9AvxfDGt6iIhLl9g==
X-Received: by 2002:adf:e30c:0:b0:39c:1258:2dc8 with SMTP id ffacd0b85a97d-3a06cfb208emr11631f8f.57.1745443377012;
        Wed, 23 Apr 2025 14:22:57 -0700 (PDT)
Received: from nadav-asus.lan (85.64.206.118.dynamic.barak-online.net. [85.64.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493207sm20106412f8f.79.2025.04.23.14.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:22:56 -0700 (PDT)
From: Nadav Tasher <tashernadav@gmail.com>
To: tashernadav@gmail.com
Cc: cve@kernel.org,
	gregkh@linuxfoundation.org,
	linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: CVE-2025-22032: wifi: mt76: mt7921: fix kernel panic due to null pointer dereference
Date: Thu, 24 Apr 2025 00:22:54 +0300
Message-Id: <20250423212254.62904-1-tashernadav@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423210630.30822-1-tashernadav@gmail.com>
References: <20250423210630.30822-1-tashernadav@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After further investigation, this bug only seems to affect v6.6 on OpenWrt
because they apparently build the mt76 drivers out-of-tree, which means the
v6.12 bug was backported to v6.6.

Nadav
