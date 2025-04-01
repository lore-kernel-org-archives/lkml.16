Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D2A2E3363
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743466651; cv=none; b=qd1r2zzlh+MxAm9m2GQgSom2ogw1OQmvkYB1s0IPTwb9vxv6HraGv0Unm6/0JxY9irDvd2PnNSxRziBw+7gyGuKcyS04+9jfbJmeMwaicxG9GZSeA31sSHpTYjmXAsvHh+70GczCTc+tnUHoK88nG4X+MjlGU97QDV6bTZAk/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743466651; c=relaxed/simple;
	bh=xZ6w73y7wZacXxUS9dMlTYmRELvACtp0WhZ7oysFGdU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=m2Mg57QcphT5MMlOkBtc613p5nZ/L2Zhkju8v6JXRu60+JmYJJjwB91nLkFk05rPMLNARc8wZqOValrmEJfvj7SqNr3z9fjtoVOkvWKh/F0UQ7QzDOh+Ucz9ep58DbWnOR63nJuCyoI1LXwpM8b+pfhVWpfmuBKohweLn7HmWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQs1/uan; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQs1/uan"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6124712e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743466644; x=1744071444; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jo1ZDVstn0cyui2K7Lk/mkLvF0vUMx+6tb2R9gkqM6c=;
        b=kQs1/uan8pQw96UNE+ay5qec91TYmPZY2WtcsT0Ogr3fzCqJF0SX/g7siSbYfmyfld
         zWjUrxboy/OusJPJ0YEanMFN5rtXED2R9f++rDtwTsdO4lF/FbKOtjGf8G2ZTpNty52K
         a7pxhz1ysuirGUHetHZx56g8TzXHVIC9vH+CiyRZdu2eNdx+yuFRgpnOzFUiC1eshkqX
         vSul2i4J6TWD5yvKpCE0EipDdDxBh7lL9tGEGQeCHlXo2ZTzxMlT83K2t+2uqPXhUXv1
         qcAYQBoP+XLjpB0x/wgY9rKbWNjEsM69syDWJXGl9U7modqiHNjZ6gbKI46r7rk92XH5
         RRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743466644; x=1744071444;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jo1ZDVstn0cyui2K7Lk/mkLvF0vUMx+6tb2R9gkqM6c=;
        b=ZMRqKBdONDDDX1C9oWZim1q07PS+aUbUVRWwnVbjSUzxO03H+zZi/a2tNDj5Ow096B
         dUEwJQUKG8bXf2RpgS0qFXumEqeOUzCArCmRgiq2y4WPrS1vPxVkTWX7G0JfeyuMxOPW
         0/TuKO+A7+iHeYglX7ewbniG75HIDr5tzhzZNq2y+3nNFjShfSwZFF5doyEVCQ59V36p
         b86THIXfBGlIX5v3NhaFGrvooar3UOSwmdp3EnYDrct/A8Jvlhx9ta7dDXmaZSJznh+K
         uiJi0BDMiQZ51ZEScfUQy7sUYBqNKpZy79+PsgXIOb65dtU9Opi+oDelbhYHLYrtolTF
         jCiA==
X-Forwarded-Encrypted: i=1; AJvYcCX8gHyayGxjfHHOavZd2gkLz24VU+pA4gTQt36p+/4OInH92cKSmzxU0h/0k0xYiOpZAXIyL/Y/mP5658A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvi3617uiwMvCWGlmOJuJk4e8+kUhMztXHPVU5OhLHojUaKT7j
	M88Wm8ZUDfLUE9uRwvIWaqdMqnewenC7dDppDf2DYbZBI2bKbQL0AIQ2zUem5tyENecYyeejCgO
	ZcZRwOPuC/jz6TjvZisJoB21lWx8=
X-Gm-Gg: ASbGncs/3zswAhhdjihoMOQ1bTh6Wk6ApX24rte7Q+2vHiXT5jlA4cyBCLcVgECrIdQ
	bObNdL1sirzaTxpEziJOzd7KnpUDc87MYrupxI209RG/vGUUtJMV2GAOfub8MFdN3PDgJekMOLX
	8vuzQRxm8bdgqj0TUda2e/qDD1Xslu/fo3RkFaY7SUtlePpOwoIxuWG7y5QWsWdetYYCUnvnE=
X-Google-Smtp-Source: AGHT+IGDb2btGLRDy04lb9dt0xj3PQkYKq9k5XC5neWZOuHOyyS8kixFy/o4CwjwA+7EI9/VQHj48vUyxMV5sB2WnZs=
X-Received: by 2002:a05:6512:1590:b0:549:4d7d:b61b with SMTP id
 2adb3069b0e04-54b1100f83bmr3142748e87.35.1743466643683; Mon, 31 Mar 2025
 17:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Steve French <smfrench@gmail.com>
Date: Mon, 31 Mar 2025 19:17:11 -0500
X-Gm-Features: AQ5f1JoGmIJKDvlHEmU6rK61F2wh-PwS8a6daImJ7piAzjm_aybO1L2AU3EeH5U
Message-ID: <CAH2r5msxpWx-jGPQZcowF=u5Lum4mYAOJtgVQ=u0vJv13U254w@mail.gmail.com>
Subject: [GIT PULL] ksmbd server fixes
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Namjae Jeon <linkinjeon@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Please pull the following changes since commit
38fec10eb60d687e30c8c6b5420d86e8149f7557:

  Linux 6.14 (2025-03-24 07:02:41 -0700)

are available in the Git repository at:

  git://git.samba.org/ksmbd.git tags/v6.15rc-part1-ksmbd-server-fixes

for you to fetch changes up to ddb7ea36ba7129c2ed107e2186591128618864e1:

  ksmbd: fix r_count dec/increment mismatch (2025-03-27 19:12:00 -0500)

----------------------------------------------------------------
10 ksmbd SMB3 server fixes
- Two fixes for bounds checks of open contexts
- Two multichannel fixes, including one for important UAF
- Oplock/lease break fix for potential ksmbd connection refcount leak
- Security fix to free crypto data more securely
- Fix to enable allowing Kerberos authentication by default
- Two RDMA/smbdirect fixes
- Minor cleanup

This does not include an additional three important fixes for recently
reported problems that are still being tested
----------------------------------------------------------------
Miaoqian Lin (1):
      ksmbd: use aead_request_free to match aead_request_alloc

Namjae Jeon (7):
      ksmbd: make SMB_SERVER_KERBEROS5 enable by default
      ksmbd: add bounds check for durable handle context
      Revert "ksmbd: fix missing RDMA-capable flag for IPoIB device in
ksmbd_rdma_capable_netdev()"
      ksmbd: use ib_device_get_netdev() instead of calling ops.get_netdev
      ksmbd: fix use-after-free in ksmbd_sessions_deregister()
      ksmbd: fix multichannel connection failure
      ksmbd: fix r_count dec/increment mismatch

Norbert Szetei (1):
      ksmbd: add bounds check for create lease context

Thorsten Blum (1):
      ksmbd: Use str_read_write() and str_true_false() helpers

 fs/smb/server/Kconfig             |  2 +-
 fs/smb/server/auth.c              |  2 +-
 fs/smb/server/mgmt/user_session.c | 19 +++++++++++++++++++
 fs/smb/server/mgmt/user_session.h |  2 ++
 fs/smb/server/oplock.c            | 12 ++++++++++--
 fs/smb/server/smb2pdu.c           | 33 ++++++++++++++++++++++++--------
 fs/smb/server/transport_rdma.c    | 41 ++++++++++------------------------------
 7 files changed, 68 insertions(+), 43 deletions(-)

-- 
Thanks,

Steve
