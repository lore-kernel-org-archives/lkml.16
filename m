Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25473190067;
	Mon,  9 Jun 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494838; cv=none; b=Cs1CNEycgDhBQVxiRR8aB0UUm0SEGUIUdtZunP8yY7EYXotNyEmunP3aesQm+4ZkeCH1hAaJ6rWTk6V0noH0kBjtCrMtJxz9cd/Gwg1utzc9mptHHujA0hLAMB2FXkFSQTCcqT1inkNPJeLM5HqrcyeVjndstwhxKJF8DiofqUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494838; c=relaxed/simple;
	bh=+NNkT0ZdCoCILHKJA/GF3XIDmD6WfR2evCObpxznbp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LPHusYZbSS/AhYFOK5WHpPNSh7FlxRJ1Cv55Oxlr6Hpz2a4BOy9iDCN84DpKhBeYBC0AXu7LWLW4fCbihzVs8ydwu7e/SLN7yk9X+UcDpspYCVSLR4qHQS/XvxSWQn0DnrRmV2abQXJhSwG8tjCE8ZZtZcD2C6o14Ku/ZzNLTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks5q1cVD; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks5q1cVD"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ea08399ec8so1993413fac.1;
        Mon, 09 Jun 2025 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494836; x=1750099636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgE/Qy9nGfhWPXMsq9Pfslk+I+4bcfNpnrS4A4N1XzE=;
        b=Ks5q1cVDP+9m3Nyeyb3qPJhD7FtCtAOnsBn15vmrm043pDslIWLjIhwGbiUKAglqT+
         hWXR1jgFU5ZTcLb52hQy96SoYVWki3Zdta+2PnBsGL3Y7kHixVzk4Aj6icaXloDZKTwa
         t/rnL8Y2Dli/Iq/J5Z8DTS7sOZZW4aSikLqCX4BY4dSgKILtrQiyC2RfFW6zCTo48cGc
         9fs/mHCODzkI0vYnVWZD6QAinno5zsNVviZ7QTrO8VeOyZWQJyOSb3T5IucRdRVXm+P/
         dOjZg5utroemqmffOGDf+k1bSnVTC6DJiuOQWb8Bqa5oE86OM+YUMemB/Z8HxVoda9kZ
         8HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494836; x=1750099636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgE/Qy9nGfhWPXMsq9Pfslk+I+4bcfNpnrS4A4N1XzE=;
        b=nnKbnw9S7e65Am+zqdgm0VM0k6LlVQIQZiZBtq8Q+1jbjeL8ZlXxjy7gfuVxrEoXnd
         1OSHSugBXGUNx30DqB31tk+f522UrwdspBi5H2copub2OzV74zA/aOpXcuU8fuX4ncqr
         WIt4iNCNpLx9HBRqr8CQrw+3ZeRdRubO1Y2tsBXTztbFn/857kwONBPuytBPK5WyoZk8
         Ht4wb4+oXJqWBECBDbg9fFktOFTzIrXTqsvSf/s8zNMz6lEfnuVBft2UWEWSA1tqbXdf
         UHEJ/ZdBtnYGYriAqfqLV4gCHoANpdDzLa4vnBjU7vy8VsnWyQGkHLYnKRTqBVqp3QiD
         +EJw==
X-Forwarded-Encrypted: i=1; AJvYcCWyQWQMXW8U/9Yb0wnoJNvdlKe9DruadQpYTpBLDyZVOFJ+TqFa0Kg0YX1T4LnmhNiQAZAW+iioMcma5sjAGA4EelCk@vger.kernel.org
X-Gm-Message-State: AOJu0YyyNM0lKQ1vgujp9lQHqo1essRocdQ0lfq44pMWuGIL9EzKtz58
	f4hvFCTGoNzbNqyplSzOx4Pxx8X/0IlR0XHM2R+zHQd8ESsG+BFFGKrV+p2pqA==
X-Gm-Gg: ASbGncs2uV776hCTgemmrbWJE/1VHcz7t5XLv9Zp7Z4uZI1u5axHZFJ9e9Bpb3RX7uP
	0+pT63KbwwZlwtKpEZFZokec/fkYqQL5DQI9bzVd3zgrP6B6QzU5VFnqLmHFrR05KiW8mvHTNO2
	2LDjeE+nhXxnOU5LJK26pzzmJicLybPIF5StzJtCXqSF1YUmifUJ+duVKsNO1+c11V1iDYla9wo
	xqdY5SoCYfG26m+/NK2ao24Wd3EvrjskOvfsFEn+PDsxnXEISG/nCjkv3nkr0jJ2JErfdErrWkB
	i3IyBqU03ZS0LaxWRdth8hsJmvhWvSYIAdQtsCPHPd5JK3nuDj9uIWF/Zj766ue+U/GqsDjiGAy
	DAIyy/8lR2jDMbzW6Irgr/3swqDB0
X-Google-Smtp-Source: AGHT+IHf5/CkDUVsLJAFZjVPuLmR8OV1rkukslpsGcog3Sha2RpKZwxNkaEDsR4GxFKDldVbqacsmA==
X-Received: by 2002:a05:6870:355:b0:29e:2da3:3f7b with SMTP id 586e51a60fabf-2ea007e0d35mr8128210fac.7.1749494836057;
        Mon, 09 Jun 2025 11:47:16 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e4b5asm2035950fac.30.2025.06.09.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:47:15 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v4 0/5] platform/x86: dell_rbu: Packet data fixes
Date: Mon,  9 Jun 2025 13:46:54 -0500
Message-ID: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make fixes related to packet data list and buffers, and fix a sparse
warning.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

---
v4:
 -  Split patch relating to list into a fix patch and a refactor patch
 -  Add better explanation and "Fixes:" to buffer overwrite patch

v3:
 -  Cosmetic changes to commit messages
 -  Bump module version

v2:
 -  Add "__must_hold" to create_packet to remove sparse warning.
 -  Make struct packet_data_list static.

Stuart Hayes (5):
  platform/x86: dell_rbu: Fix lock context warning
  platform/x86: dell_rbu: Fix list usage
  platform/x86: dell_rbu: Remove unused struct
  platform/x86: dell_rbu: Stop overwriting data buffer
  platform/x86: dell_rbu: Bump version

 drivers/platform/x86/dell/dell_rbu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.47.1

