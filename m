Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF491DF26B;
	Fri,  4 Jul 2025 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658616; cv=none; b=up47COhRBqjdmQJtL2r+HDGkQiQWtAexUZCApKEOrYrAYuv6oGw27L8q+kC4/OUcTortjI65MZ69OWpiiwqu6Kprrge/JLzVXFkWFEoO06s8Q9EYS5wU0+NjyEBQyl0ui6WUBb3CSKt++WMjbYPnSWSJE2zu7OvZDoAmj7029pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658616; c=relaxed/simple;
	bh=oJ92alFGv2mHGv2Zejy39KR2OPChGt4JgThMFt77smc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EjCoHm+UeFTvtjEeNU31KUpbig0k/9w8Dfx+MDfuvPe3GK4PFlw1nZrfrnJ7ONH+wcqt5SQSjpDdmh/sRH2fIJiSnYBt8Os5SjAjFZv7zsG7ZNMQDDXBG9o0fJ2tKaF+4LDD3+WGk9ihbK4qreKoLUqsPsjf9PXBwctaiQkS+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqnJB2wR; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqnJB2wR"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso13813786d6.2;
        Fri, 04 Jul 2025 12:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751658614; x=1752263414; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uuy803JMwn4a/i8FG5eV3UT30ek5GEe+MlonQyuqQB0=;
        b=DqnJB2wRiVm05u0D8qAOSvfmJ2rUjMgEZAUF9H54DI2u5EDOj8oV8Gf+r1879eGizx
         8zrkUfdp+sjJZLJPA9Tq8u1KAjtz8tu6sGKyYJ2muXRGCl3v4Bbhrc+XE+s+4zBzCji8
         9iJhCUENH3rurMGp7CgIBNQVxg4kXgLLShQQCGGcTb/MureEv1PhRYWHT7mXha5NfTSg
         Lduuxsi06Xzlog2dlK47DgnMsHlIXDgrsNAzn4FOd43tDITAkWtQYNd41jyOnjdf0Gkr
         drVLKdcjPthyyei2qJ+SYCaVN6orBRoqfindNDJ+3PaR0H938G8T6txhw/9mwixaVEpP
         hICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658614; x=1752263414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uuy803JMwn4a/i8FG5eV3UT30ek5GEe+MlonQyuqQB0=;
        b=ULZrIS2KZ8iXnOezKvW+Ve2OICSk7piGgAk0Q196JeZnr+9iM+nzJls81iLtm0P+Ij
         FxOtAXd+hzZKoLg+Nn2Bke+eiw+wptOh7tYva9BgjINoWLW2vC5RKpW3DG5RrE1TjqST
         Hwy03Sj6uw4nJyDUkriMLgMfhNe9h7H7bkDWA5Wek5QSiASfoAOzd47bN78GaRSWtIVy
         ZleKrvhmt/UVUcMyO3vGydRX5pmAOJairLC1nFn0QgIqHPsLhPB9s7cUJmZTuRX8qBQG
         Q65Fssl6k8qELdCN7PV8qMe6hfmw4WIvdXZ3SLe7gMFDRJvow+78o+3McOg6o53zogwk
         32zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiNt4hVo1aWYW4ZuLiO60sMPMuzyQLY0BaNwVxB2/o3yDc86oZrwSfow/o2Ygul/Qb5FWUmuaAgu09uGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgO89suTRi56+Ql5kUZlYkrKr1ge2kmNHpiS1eSHJlfQ6qniY
	/tNkrauO5D+831dXrQPe0BKXi3jj6yoskN87Yyp0uDJLCEHGY0axnt3k
X-Gm-Gg: ASbGncs9AqzL1Qk8eG+M+WOphpDj6WmXjXhV1Ib8v5txO2LiD2cmvbV0WTEs+rB7TOG
	OqNixhgCrTiZtreZkVx9jETpA3C+3aG5pQcaIJcZ8RiCy+QpWjPlNY5iZ6uf0G+CCKbumxAlYqi
	uV56VqN/Yo2AmdDH0X/EHJuJJ/0wSYiVCEQQbZtzghwPVwEdmyCfLzKhTCKfTc5S0qghMVaTYK/
	lHbbb8wxkNSB9DbOGgozVFFkVV4zsl5tEkFKnfcddkMT+eY1qK7dQ1B9jTIAWob0Cy9sOkA+NtL
	gJ6r2pE8sXGTBKaD8hexuzFUaoNyaZqmvnwSldT1/icSaIhOPlySOy9eUlAKt7RNVglQ29SW+si
	CGqkFYkE=
X-Google-Smtp-Source: AGHT+IHM39+ZHa/ldA+C/hgDFd/PvpZiHS7TrcVOAuEe6ibVn2SX5OxJnmcbQWJYfy0Ckci6ZPrTNw==
X-Received: by 2002:a05:6214:ac6:b0:6ff:b41b:b5bb with SMTP id 6a1803df08f44-702c6d8743fmr46698886d6.26.1751658613951;
        Fri, 04 Jul 2025 12:50:13 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d51147sm17555126d6.57.2025.07.04.12.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:50:13 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 15:50:11 -0400
Subject: [PATCH] rust: miscdevice: remove unnecessary import
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-cstr-include-miscdevice-v1-1-bb9e9b17c892@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHIwaGgC/x3MQQqDMBBG4avIrB1IQ6zgVYoLnfzWAY2SsaUg3
 r3B5Vt87yRDVhh11UkZXzXdUolHXZHMQ3qDNZYm73zjWhdY7MisSZZPBK9qEosScJBGRv8cHAR
 U9J4x6e8+v/rr+gOAcpdxaQAAAA==
X-Change-ID: 20250704-cstr-include-miscdevice-4c5cb26a0ece
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751658612; l=741;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=oJ92alFGv2mHGv2Zejy39KR2OPChGt4JgThMFt77smc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOXcdl9SfixjgeRu+qsSvOk25nFvvBUwX8qzn0CEEcwfPj14Ywpg2XdSELNNQ4xcAgGNBNMYj44
 mrAC75nTSnww=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

`kernel::str::CStr` is included in the prelude.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/miscdevice.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
index 288f40e79906..8309d656088a 100644
--- a/rust/kernel/miscdevice.rs
+++ b/rust/kernel/miscdevice.rs
@@ -17,7 +17,6 @@
     mm::virt::VmaNew,
     prelude::*,
     seq_file::SeqFile,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
 };
 use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};

---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-cstr-include-miscdevice-4c5cb26a0ece

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

