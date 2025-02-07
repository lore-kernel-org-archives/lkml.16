Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59715445D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908665; cv=none; b=ocUh3IWrV6NyG5B9bqk1//1SDvYp7itOk6Gf4RyUxKOMz9AWMCFUC0EmvSqyBscZt8pyV6KgOlecnQY90aOYcBPgZ0r9MS6F7oY0muCUNFQQWbheuk7wnON1fPG2NjFNI6hxy83KpbeRrJfmgJc/8nCE/yIlB01BZ3giIOemgkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908665; c=relaxed/simple;
	bh=luM/U1QzNcfOEe8jQ4dOzHmGDvHwvg9P0neXpfs/o3g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gYaesMHt8FfkhyY7ZcA2XdYgPl1lzpCFJsMxT089dhoOx4fx6nmgEnmqB7KqwPpJoPXc8XFNvlXgtM53U2TdssK4+F8aBcYn3hmTqAWapjDKoeeM9mZy09QxXI/Fvc6ztJpTcI3rkPS6drFqmzwGvIHnHe9vwTcjnpHul7D0bPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=3FsBzfsm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="3FsBzfsm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f4500a5c3so24630215ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738908661; x=1739513461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne/1UeulZde6sbRY8ZM9PE1LYrjRUVoPX8w/HsO/eUQ=;
        b=3FsBzfsmQXHEC9DrsC3pVE6pCV3sEZ4W7gpZuXIChA+Ayuo26y8XWHemgnczdHaBmH
         dKKnr8mr0o+DwqYqfPz/Avo79qQT7+RF7IHsghFVmgTWwAgh7nIbMrSaIzvehg0HJbGe
         rosuaJeXSosDRTmdWgj+50ac/YjLfso+zq6E3t9e9AAK/+uR4fwtcttyzuo3ExckWzNo
         k+0ADq+ziPu3eEBli+nNzT7X5d1JTMNJMNPSGvb5n+dI3VB+gmXW1RrveIfyrPZTPAJW
         fOVGMP6PCx5TH87MP2eWae+SE+7GMH8+5YS6NZx0zSjGYfZf6bW5DpZeS0R7wLLJNfUi
         jXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738908661; x=1739513461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne/1UeulZde6sbRY8ZM9PE1LYrjRUVoPX8w/HsO/eUQ=;
        b=La4CSSiUCKC04VQgFx2JqTK+AcjmOuz8IzRoJnQ/yyFM4pZoIgdJc80Tz9xCxjQcbI
         5ntTW1AF7aYGWKsU9LO0zUVXs2ZXF5Qydf4izmTMYAC9SB2WVE9Nhvrn/grv+cXA5A/l
         RrCCPDD60xz0KJOVsRJ8SYzqJdMzl56oCzJ/dbrnkaTx6OoLseCs5/xn51HmOEFpm62r
         P2HInPevbz79ZtG8OPvGdYvaaY1fEToCltyGmjkIjyqxak6bpa0TRQOyQIS8Jt94AlfN
         0iF4LywjTojcbVfOLiu3LhgXyeoPDksWlbO9wO5nlir4mfEgCdH7lX5V2LL0fQn326Mm
         T8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQd1azNNkbp8cXaP+GbplLWWuefsMguRqsPb2Kr0+l/2F5aUH17pU8l+5VCAplwxqEk3DoYEG7uYYysr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBhRLUYhgMpefCzuNdaGYq/cd6Et2a0aKJsXnxbPlti09nRiE
	ZUxIm0nnb0ozYuw7LL/nkv+378D2dV2zZO57RfGgmad95JkKDxHWzVkFsYcpffU=
X-Gm-Gg: ASbGncvAX5YqgiyFLjT0RdH2sxD4JDrCKvQNZNjB1gPZB6JGPNZe2DHcNAUiu1NEjvt
	J7EHzFlKOWz7VotiFL2dF9nHaqtDf8IStBSI0TLAtQRrLE7fzI1TJnXvNQJU67mJ7Fr3Up8Psju
	CG9cZXUZH/6+ZeuHubr8AmRX9HfL+TINFu3wRJUkqprbypP0Rx4Dt5ujqbAHpb1sYtTvFHBGbIq
	n0NVI2og60km3fafsjzVd176U93ObeYcaV6eZilp81UTyncvhCslT9r98tsw94IgFP6WPZXP9bN
	x5hnOkZTvhUKQ7Jy61c=
X-Google-Smtp-Source: AGHT+IEXXUlF+ji1IwGpl49YDsSy/JRDfposJyyxja2xvI3d3x3Tj/H8aRWRC3xeiJezmKd3w1sGvg==
X-Received: by 2002:a17:902:ce90:b0:216:2477:e4d3 with SMTP id d9443c01a7336-21f4e7f2c46mr34322025ad.51.1738908661173;
        Thu, 06 Feb 2025 22:11:01 -0800 (PST)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21f365517desm22712045ad.86.2025.02.06.22.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 22:11:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH net-next v6 0/7] tun: Unify vnet implementation
Date: Fri, 07 Feb 2025 15:10:50 +0900
Message-Id: <20250207-tun-v6-0-fb49cf8b103e@daynix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqjpWcC/2XQPW7EIBAF4KusqEPEPzhV7hFtgc04SxGcYBZ5t
 fLdM4IijlyOZr4neE+yQo6wkrfLk2SocY1LwsG8XMh08+kTaAw4E8GE4kIyWu6JGgOceTWMbLI
 EL78zzHFrKR8kQaEJtkKuuLnFtSz50eIrb3tM0owz15Iqp4waG6xTo1TSqvfgHylur9Py1QKqO
 KKhI4FIOhds0F44609IHhA3HUlEkxnxnsNgZ3tC6oBE/2hViAAcD8EzGex8QvoPCaY70oi4Dmy
 UApyd/z9v731l+Llj2aWXdt33X7frixuKAQAA
X-Change-ID: 20241230-tun-66e10a49b0c7
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.14.2

When I implemented virtio's hash-related features to tun/tap [1],
I found tun/tap does not fill the entire region reserved for the virtio
header, leaving some uninitialized hole in the middle of the buffer
after read()/recvmesg().

This series fills the uninitialized hole. More concretely, the
num_buffers field will be initialized with 1, and the other fields will
be inialized with 0. Setting the num_buffers field to 1 is mandated by
virtio 1.0 [2].

The change to virtio header is preceded by another change that refactors
tun and tap to unify their virtio-related code.

[1]: https://lore.kernel.org/r/20241008-rss-v5-0-f3cf68df005d@daynix.com
[2]: https://lore.kernel.org/r/20241227084256-mutt-send-email-mst@kernel.org/

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v6:
- Added an intermediate variable in tun_vnet_legacy_is_little_endian()
  to reduce a complexity of an expression.
- Noted that functions are renamed in the message of patch
  "tun: Extract the vnet handling code".
- Used clamp() in patch "tap: Keep hdr_len in tap_get_user()".
- Link to v5: https://lore.kernel.org/r/20250205-tun-v5-0-15d0b32e87fa@daynix.com

Changes in v5:
- s/vnet_hdr_len_sz/vnet_hdr_sz/ for patch "tun: Decouple vnet handling"
  (Willem de Bruijn)
- Changed to inline vnet implementations to TUN and TAP.
- Dropped patch "tun: Avoid double-tracking iov_iter length changes" and
  "tap: Avoid double-tracking iov_iter length changes".
- Link to v4: https://lore.kernel.org/r/20250120-tun-v4-0-ee81dda03d7f@daynix.com

Changes in v4:
- s/sz/vnet_hdr_len_sz/ for patch "tun: Decouple vnet handling"
  (Willem de Bruijn)
- Reverted to add CONFIG_TUN_VNET.
- Link to v3: https://lore.kernel.org/r/20250116-tun-v3-0-c6b2871e97f7@daynix.com

Changes in v3:
- Dropped changes to fill the vnet header.
- Splitted patch "tun: Unify vnet implementation".
- Reverted spurious changes in patch "tun: Unify vnet implementation".
- Merged tun_vnet.c into TAP.
- Link to v2: https://lore.kernel.org/r/20250109-tun-v2-0-388d7d5a287a@daynix.com

Changes in v2:
- Fixed num_buffers endian.
- Link to v1: https://lore.kernel.org/r/20250108-tun-v1-0-67d784b34374@daynix.com

---
Akihiko Odaki (7):
      tun: Refactor CONFIG_TUN_VNET_CROSS_LE
      tun: Keep hdr_len in tun_get_user()
      tun: Decouple vnet from tun_struct
      tun: Decouple vnet handling
      tun: Extract the vnet handling code
      tap: Keep hdr_len in tap_get_user()
      tap: Use tun's vnet-related code

 MAINTAINERS            |   2 +-
 drivers/net/tap.c      | 166 +++++-------------------------------------
 drivers/net/tun.c      | 193 ++++++-------------------------------------------
 drivers/net/tun_vnet.h | 185 +++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 229 insertions(+), 317 deletions(-)
---
base-commit: a32e14f8aef69b42826cf0998b068a43d486a9e9
change-id: 20241230-tun-66e10a49b0c7

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

