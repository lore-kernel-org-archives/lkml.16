Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF692240604
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349278; cv=none; b=gNBs2DwP5h4H8V3ymfERT7VadnzvgjJQi2Svjrqt9Z85f5sgRqNQbeLZPRMIJn/00sL/2M2ZYkUu7wsWx721rDi07aBzLBDaZojhrEQjwxu/vn7P5v/1XyzLtOXuiL9f1hFhSIqmkb6Db+XUwrx5KWvLbgcZfdfFSLH0Ky+fcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349278; c=relaxed/simple;
	bh=zm8f+XbfBaBm9TWLCzudEh0969smWg4jpHxzciP3nts=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IxbuXx7ymGZ2Az5og4+LM5u3KjF0nOY+dw9YjJkJKh6v7eVpTnxAavnE7uI3R/rBMNE3lW+MSnDLsMGIursnqZGjiz6Fe4EyOvkjjnLTISexws4uKl6YEydnFhVc6pX+k7WFMk3KuAiPioith+4/i3Td9vAVT1BLUTzDCyzFcMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IU6TnJpT; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IU6TnJpT"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a375938404so2218421f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748349275; x=1748954075; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7EZfR79TUOD74W0kOihVyn9Eguwj1PW4Tc4XDWwTRXs=;
        b=IU6TnJpTRt4hFFsKsyCKOc4YX7xx3bPEVaf1HYmALoZaSY57iExs7GxL1xPf2rv7xm
         Hl6S8ILJSNVrornhcKRl5OcUheH9HU8eEM87KUM2njoIF7xEDm7h1wcSxT0TjIeyS1CK
         BQAZgR2G/gUtohBNCy2wFIUr7BrtGX1d6CRet+htkLvjuTWtprwwdp1ojP09JKvHElqU
         KVCqf36Umulv0pSaVAD0iVl3vY8miCAXBAqviL+WkSWIyUsBQbVAZji45xbSBsnRxcWI
         tbLL2BUJKKZWrKnoiVK2UrLWHbn31wFCGhI+SllIfTpDIzMgEFmYF34bNJE74UdBATQm
         w9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748349275; x=1748954075;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7EZfR79TUOD74W0kOihVyn9Eguwj1PW4Tc4XDWwTRXs=;
        b=fab+jFnZ2/gqes9wNyQkrR3uXDmnRK882N7OfoQ1mgFsLb9hZBurISJfsLeMbYN8TD
         RVtvG8URUgU7L1uxPnxXTlm0jCrXh9f1WVkY1L3YGop/sCwwjwaSkd5k1Fg60COU6oDj
         wxagbbcbQkwR2U5Bc/XU/2OVJKsBEVUI848DW4a96qr0Zf3XHJZC2xLX2eWPRiHRJR2r
         pAZLeHHKbXJffABZ013tpZYsePf1Rm4+W1TJMyNTs8GzQxV/UCaOwHttrUlEIlTKX8uO
         jBwCkrAE3Om6/cq+GayqSqP1tDbkKFmpufrW5OVwOI4RHrLFeqgsrfdLxz49ZVSjaO+l
         08Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXjkVsLE+blQqH1V1ildxksHvjwDsLxYFseQDCGLJmaf7qenRekQLptKE5HKOF9UMnM5beyfpoWZV6qcIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhmcPYQMaWLERhXTEJNZMg3dLrolZp2rjPKBy8xfvjn9tf2W3W
	3w9l7TzHCKISL4MxCWiO0fxrPZczQC8spn8gC0iN6EnZ21SUhNyFnhngfqBCXV3IFNXJI09So3+
	OLSSXgWVzwE3u1yyd+Q==
X-Google-Smtp-Source: AGHT+IHbTzUnbD4QU88pHfVKcUpbZQ3IQk3dzdmFq1Dq60S9+kjTKanyLuqcIWdj/XWLaoAzWu4qIApdkHjXGLI=
X-Received: from wmrm3.prod.google.com ([2002:a05:600c:37c3:b0:442:cab2:15c3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3111:b0:3a4:c713:7d8 with SMTP id ffacd0b85a97d-3a4cb44925cmr10348616f8f.16.1748349275276;
 Tue, 27 May 2025 05:34:35 -0700 (PDT)
Date: Tue, 27 May 2025 12:34:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE6xNWgC/33NTQ6CMBAF4KuYrh3Tln9X3sO4gHYGmgglLRIJ4
 e4WNmokZlbvJe+bmXl0Bj07H2bmcDTe2C6E+Hhgqim7GsHokJnkMuGxjMEPrlP9BORsC4+wBkF
 S87TiSmtkYdc7JPPczOst5Mb4wbppezGKtf2njQIEUJFHhFKkeVJeamvrO56UbdnKjfKTKPYIC RwyTKlUpeIV8R8iehPh9ogoEHmi0iwjHVMhvohlWV6OZAedOQEAAA==
X-Change-Id: 20250424-strncpy-from-user-1f2d06b0cdde
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=zm8f+XbfBaBm9TWLCzudEh0969smWg4jpHxzciP3nts=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoNbFSf7Ncb06wiBcurbUfrWLPVhBsY7nIFW6HR
 UrWTborWZGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaDWxUgAKCRAEWL7uWMY5
 Rr9xEACDBjeTNDz0Qlul7AMJCxWMa8EOeslJUADgwBwEwbLVi0ih6g1d9qFq5QCkRs5gYnKqRIz
 kHDfJeaFTLsWte7DuQxlOApRjwbb1RCMTlaqwqM3R5L/H3DemHFpJ+LV/mGAEH8OoCA9h7LNckt
 Wys6eZGZIdARVuTYReYH3dKixqA7sDXPkTQnd2W+5xJ7AGKB7ZB1eSGETEiBFt2ZsanmXmQoEPX
 jvs2veDZOX2LDaNE8VugubVuTB+1VEJ47ppDDjdaGBMTvZtt7d6J4tbRXYiWDHIlzJBqCoav1MM
 G3TEq/n5Lzx6lsF7WEgt6az1iNsPMtR9i3bCUc8yCeyaobqhxINOMVeAm33KMK1kTmptyFtaCCp
 SVONokpxt0G8GaABZqoEfywZ/RZn2L/ZhFQjQr6MgvQlLfNp6HauJwVe8kFv009NUjUekpYfuEk
 nmU489iN8WF4trihlVA1ciSH9+n+wCr3E9XY5n0j4O4FYZC18IXEKbMiKHlW0mIn/SYwJUuRzYP
 ITP5cSLgVdxSb3KWmh1hNpNnFvNtE4PUFC4d7qAI/um4CIA8pi8fBfC5btm5la4aLafsGhgvTSG
 YGY4xRFe042UquzV8E+s/bWtuhFltbWrsoBvTP+Iq8Urbr4rFXt9aEOfDnMHzBB+E9I+3n4294y CgONx6gYrydXu7A==
X-Mailer: b4 0.14.2
Message-ID: <20250527-strncpy-from-user-v4-0-82168470d472@google.com>
Subject: [PATCH v4 0/2] strncpy_from_user for Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There is currently no easy way to read NUL-terminated strings from
userspace. Trying to use the ordinary read function on an array of the
maximum length doesn't work because it could fail with EFAULT when the C
string is shorter than the maximum length. In this case,
strncpy_from_user is better because it doesn't return EFAULT even if it
encounters a page fault on bytes that are after the NUL-terminator but
before the maximum length.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Swap order of arguments to raw_strncpy_from_user, and rename buf to
  dst.
- Update safety comment on CStr::from_bytes_with_nul_unchecked.
- Add `` in "This implies that len == dst.len() < buf.len()."
- Pick up Reviewed-by tags.
- Link to v3: https://lore.kernel.org/r/20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com

Changes in v3:
- Remove pub from raw_strncpy_from_user.
- Mention that some data may have been copied on EFAULT.
- Add more comments to strcpy_into_buf about tricky cases.
- Rewrite documentation of strcpy_into_buf.
- Add documentation alias.
- Pick up Reviewed-by tags.
- Link to v2: https://lore.kernel.org/r/20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com

Changes in v2:
- Rename the raw wrapper around strncpy_from_user to raw_strncpy_from_user.
- Add a more convenient helper on top that adds the missing
  NUL-terminator when necessary.
- Link to v1: https://lore.kernel.org/r/20250424-strncpy-from-user-v1-1-f983fe21685a@google.com

---
Alice Ryhl (2):
      uaccess: rust: add strncpy_from_user
      uaccess: rust: add UserSliceReader::strcpy_into_buf

 rust/kernel/uaccess.rs | 89 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-strncpy-from-user-1f2d06b0cdde

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

