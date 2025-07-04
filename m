Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97255222561;
	Fri,  4 Jul 2025 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751659872; cv=none; b=t1QK9dvYFNQWTsOakFIYGu9VLw+X4NPbT1Sbt/M8/2tAZSkDgwQgDW0XJXuZg5+U7xsKYPxhP+aPazBdV2HjP7hWzhlL8K87ar2hTV1oM7gTBjccmb2pdST5IKVmsJtpX8pdt1HD42BChEwXG8w9NpIVnRiEfmgdAvFg3b2QMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751659872; c=relaxed/simple;
	bh=xyU6uAhOJFTTuiZlGcjWr56svU8olg3CGdmVMv36y7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LnnHK1ythU+1OnYRMGJsqhctd1M/VDd4MqYokNXObsggtKEfu0BqNatTnbzO+7hy10LMjxJRAyke//iwyP1tAEfzW9YLxdX77tCVRsOvuEmahXaFUNiovGx6rjHzr0s6cl2hJj0c9mAMZVRwlXh2ip2cjz5WvmkrzPrU4pJN1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8Girof4; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8Girof4"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso15745966d6.1;
        Fri, 04 Jul 2025 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751659869; x=1752264669; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mf/DDCcZnsJSVsH/PS84kBD6n+/aJ0rrxuIRQq4BkMo=;
        b=P8Girof4riONkaOXKBGtKSwQ4/SKviQp4eeu+KB4rSZzw7RFLuTjhtEmzxwSqr4c6Y
         4YP6uYaQLhTMp88SE+Wh5Glrp6L8F2T1oJQ0Og4V9C3myWIp1X5+GT+vqJjDv54zr2zp
         kCMhGwRIsDErqMy2+xQJzlZ+b6rp8N8rumVZ+JzRMHU7spbKvw7iJUeD6wqvAdy9KjeQ
         CCoZl3CUP/x6Wl6s4UnsFhN3BGQzN6u9pT/tJFlyqCfyCsjZqwlpsX7Brj1XoInysqQ7
         cWNGEpE450t9MaHfjt2Z/lpSw+59MRW82G2rJ2ZQpBsIFVhWBs9X1gd51omWz6cugZQs
         MU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751659869; x=1752264669;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf/DDCcZnsJSVsH/PS84kBD6n+/aJ0rrxuIRQq4BkMo=;
        b=RSaYkBYkKWAtp8WEJz+Q/V4LQAR+qO+4wG1qsa9P4a/U5vl0xQqkUMOVojIew8RFcH
         FEI8wNWuFHul8H0gfeSbF9/jAGmYZhr5XT/O+fDMw8JRfsfX67VyR+uvtX1PqqycVZ3N
         LQUw649QRmLtRDA1eZSC286trXOxbVUaaSjC6rMee9PKnAO2C3tqEs44frrzAlq7b3Ra
         zEjdU/lAbgdFmNuMM1IIb29qgBt2zGjOl6DkupC0RaoZS+PA5sfcppbTvavzldgReyrY
         wAvyNKJV/YQhafN1g7tKLfc66aC1ehLho+FXMsG7kvs+DE7s5n3GUwaOyXhpr3Db4don
         Lq8A==
X-Forwarded-Encrypted: i=1; AJvYcCWZkav9nCx+RqihUe9NjafM97H4lBUuQ7UwBrzTdSjYQEmJXO6ja71cFjkJ6l9H0TOMUfIyruG/VRJ1l/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQ7RfA7bN5quclIaaijy8/jK543/BPdxMO0KHkEQT1JmPPRnT
	SFzXRqVFo4Rzc8AAXxabzncQcngRud1mHeJOMTQe/BqEJ1w8HDRDiE5+
X-Gm-Gg: ASbGncuUMFuX11ILnKCUsS2LZOSiotMltlLdf4gJk5a2veTRxtvOJWDtc/JBAON91Zb
	qn98Nqxr1EPTiQqSiWwELQoIbd5r9BCL5ILBPhAr8rxYmauhPSJtZ7go6CJnTA7/jQUie4n9HuL
	Dqgq/cOTzfcQS4wddaKpKFyrkMmzxUAAYQyqm6gvV0J23Tl5pU/+uqXHlL+uxiYzUnJDZG46o3f
	+lNDHMK1YP4RYA6z0Fi7iBO8g/nju18oCdqYpU+xxybaB9vdwwmGK8pCoxxNQMDGNA4itwHBQGu
	F76RF1CfiEwYB/9CjYO2zKQv2A7Aky3u719EXV9bWVLF0d0SCfnMqwvqjMVQ8Ab6yUz2gz9pDaI
	giMz0W6c=
X-Google-Smtp-Source: AGHT+IFM+bork63tek2k/c3Xk4A4Pt0JyMCawr8Bl6YQbcAkUDUOskUr1wZnV74joj/kQEfP8fzwbg==
X-Received: by 2002:a05:6214:f66:b0:6fa:fd84:9615 with SMTP id 6a1803df08f44-702c56e5bfemr68577176d6.9.1751659869459;
        Fri, 04 Jul 2025 13:11:09 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdb4bd6sm201937085a.28.2025.07.04.13.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 13:11:09 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 16:11:02 -0400
Subject: [PATCH] rust: devres: remove unused import
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-cstr-include-devres-v1-1-4ee9e56fca09@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFU1aGgC/x3MwQqDMAyA4VeRnA20nVXYqwwPmmYzIHUkU4Tiu
 694/A7/X8BYhQ2eTQHlQ0y2XOHbBmiZ8odRUjUEF6IbXIdkP0XJtO6JMfGhbOijp9CnRz/PBLX
 8Kr/lvK+v8br+hPCCt2UAAAA=
X-Change-ID: 20250704-cstr-include-devres-151c26d36bbc
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751659866; l=875;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=xyU6uAhOJFTTuiZlGcjWr56svU8olg3CGdmVMv36y7o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QED0Tk7rodVqOBUQRp1McBwCLRXrzXRM2HyM+QWVfSxZu/6lUHrZjYUO+laV7q1ki0d8ud0CNBp
 GHrhPA8wLkQQ=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

As far as I can tell, this was never used.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/devres.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index d0e6c6e162c2..dff443908278 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -47,7 +47,7 @@ struct DevresInner<T> {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{bindings, c_str, device::{Bound, Device}, devres::Devres, io::{Io, IoRaw}};
+/// # use kernel::{bindings, device::{Bound, Device}, devres::Devres, io::{Io, IoRaw}};
 /// # use core::ops::Deref;
 ///
 /// // See also [`pci::Bar`] for a real example.

---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-cstr-include-devres-151c26d36bbc

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

