Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809A7260B;
	Sat, 17 May 2025 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481643; cv=none; b=b5QkBhQ2IXUm1T5biD8nuWU66sjzmoSb6vdQglgTfRDUl4cA9DvA+Pz/3QRjerDt8HJ6yHJiWU3hCT5TDiQ/Chc/nSAxELsVomJHVpwsIBVMYsWyQHRGE5Q6EjB+pJb9Jdw8FygJnRvSJJs+cqMOm3f7TDWFFQb8NgmSVuAvFQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481643; c=relaxed/simple;
	bh=Z+J5FMLObeQipB/hJdZWGRiBTJenJRg1zn01/tBI92s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=epJAyCguos+0vcwpKKknz/H97F7mjJ39I/uQHGkLQGOcPgtAO87ikbHafjmRYMT8BV/1nR3xCkoAKR1+1vwE5+PpmaxLO21wkCsrBc7LI0R6kQDx6KrQf/ZxSio4ZF6fcYQSrKcb6uLBQbjPXbj0ZjRYqB2y6NJW5x535Ai4Qeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SytvYNDV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SytvYNDV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso27337845e9.2;
        Sat, 17 May 2025 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747481639; x=1748086439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c388y47Qqkz1KCLQI1yDNuSC8yCtrWHIFTaZp3qjkN8=;
        b=SytvYNDVIYZc695jgQLNiyyMgvQlZZfTkWCMi5gLMpvdtkFDLEoTk5vwHpNrOH7E4Z
         9bygZQdHMzQXszbmyoFuqNxhlo25SW+XZoIXQ7MlOsLofS//BUvcFijKCAY7CP3xWCMB
         3tj35xBbw1dUic7UNSgCDSgVQBzUP/Ew9j2fwDuI+2lh7Go0MO+MPbcgycNuWwArN179
         H9L6EgZZwiR0p575dcZxXd9s8URpoLR6SQMNlnIttMd2oXxBEZrRUoO9Y6Xpbp/LUY9a
         ORQ/+5LEb5V3A4NX7by2J+rf+fBoUNCd7Bp2uNE9WYaQdf4f/OdihNQhzHiySPy6oNJE
         bjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747481639; x=1748086439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c388y47Qqkz1KCLQI1yDNuSC8yCtrWHIFTaZp3qjkN8=;
        b=qdRT3K4ITwcRAIi1bdywrBljWoX27HGSp593Ouay6RWWwArL45MrgY+XdP6vrSmEXW
         E3W00PcKJJB+tqTAvRYNsJxCNxFLVKe+Omrw9eraP9t98zelRdhUfc8qTL/VowoeJrdZ
         rql6NordXpxl8/EVhzCnn7AZ3qjLHd/9Ym6GL96C/RbRRcGTDkKMEkEYFaWXypohOoYL
         HX/sfLnuh4oVJJIVvx9lAr9JLOcHcndcLhGhTGhhVYZJM/bU+Yv485JrnslSsVX9s67B
         Ezw0742A83mm1KkeVgmD30E6wCQJJPkMx4S0ZQLmpiQBCD5W9dvhstDdDh9vblQqW3O3
         PAbw==
X-Forwarded-Encrypted: i=1; AJvYcCUKz3T8tY+XAFsk0ldDLraqv9JuP5S/KIQWbw4KML5AMaINUD/IAO3/YG9pnA6hMaWn+ydGjPMnPaCNwoQ=@vger.kernel.org, AJvYcCV3pckIKv5FlWI4ZfSXzcyMYb+CmcIRHX+jVuIGw35051VSmrXWHrg+4hZGZebxQh1PpoVS71NAeHxBJ8DDHqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRojpSk+sfUE3DAMVI9hECp+PPcS2DhTg2aSMUbPGfZoJVO5o
	QTxIAF7Na2GmKxkn+/xt0C3Psped2ZZgE6zO7eMY76tM03CQMpGv7GOz
X-Gm-Gg: ASbGncu2wI8+uNxodVBqNf+c8TZ4PM6CdH3kotIob3ItdjAVUHocJ1dngIYSreWn4sR
	/XCupWr+9+bWZoBmFWElxvsiJVzFm5OWo87DFyVSn4Zyz4B+jTdjSri+twEFAmv3CoLHqmJ4+TW
	/BEErOxFzR5N3+8Ry9BqJ43WvSLTtm0hxYuKOc+oGGORKfPcwt6FJx4QB53pnxdDor/1/OY9ngj
	frLv021D3/kQepxSbjK6N6rm8yYCQxDVzgmTrDHyDctO/5R5AVV7QOKpLAS1vbXlp5rYEprhsGf
	eqbUrrDwex+L6FxgLskjQ1rDLOkrcJ3odcEqtIA=
X-Google-Smtp-Source: AGHT+IEui3EYen9awbcgFRrKYxZYGp2rH199+8b0TQ7Est8d0o64vgrFlfnVpYRd3yAWotgeDxhqdw==
X-Received: by 2002:a05:600c:8185:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-442feffc24emr53139315e9.19.1747481639500;
        Sat, 17 May 2025 04:33:59 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::171c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm137017265e9.24.2025.05.17.04.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 04:33:59 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v3 0/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
Date: Sat, 17 May 2025 13:33:48 +0200
Message-Id: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABx0KGgC/5WQTW6DMBCFr4K8rivGQDCseo+qQmPPmFgqkNgGt
 Ypy9zqwaJbt8s3P92beTUQOnqPoi5sIvPnolzmL6qUQ9ozzyNJT1kKVqikBOmlqGdaYhslHS3n
 B8hB49DEFTHmXMKFEANKarFG6Fpl0Cez81+7y/pH1OY8v4Xs33eBR/R9/A1lKJuNAE3Hj7Ns4o
 f98tcskHvxNPTEr+BtTZWajtQM+WYeGn5n344nA1zUnlI5PfgPqi92qBn34rHNEx8PFzzOT1B2
 QZdXmNvXbHojByDKTJ5/6oiMGVF1lNVsuS1LqZBRg1bQNsIVWG1bYOcxn3H8A90QDnrABAAA=
X-Change-ID: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747481638; l=2834;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=Z+J5FMLObeQipB/hJdZWGRiBTJenJRg1zn01/tBI92s=;
 b=dHP3zvJNxk6vpiSJJW1CeksHhlxbeLdVd31t5dNL7SV6t1hzUg5sJA5RNfDjYC/bfj9ETlabQ
 IV2lucQDewCCRZwvYYg8EmijtfNLiyuh/BK/uCJQ+LCuFP1TWCEYvLN
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

Currently there is no good way to pass arbitrary data from the driver to
a `miscdevice` or to share data between individual handles to a 
`miscdevice` in rust.

This series adds additional (generic) data to the MiscDeviceRegistration
for this purpose.

The first patch implements the changes and fixes the build of the sample
without changing any functionality (this is currently the only in tree 
user).

The second patch changes the `rust_misc_device` sample to use this to 
share the same data between multiple handles to the `miscdevice`.
I have tested the sample with qemu and the C userspace example
from the doc comments.

This series its based on my `UnsafePinned` series [0] and the 
pin-init-next branch.

Some discussion on Zulip about the motivation and approach [1].
Thanks a lot to everyone helping me out with this.

Link: https://lore.kernel.org/rust-for-linux/20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com/ [0]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Passing.20a.20DevRes.20to.20a.20miscdev/near/494553814 [1]

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v3:
- Rebased on top of my `UnsafePinned` series.
- Link to v2: https://lore.kernel.org/r/20250131-b4-rust_miscdevice_registrationdata-v2-0-588f1e6cfabe@gmail.com

Changes in v2:
- Don't use associated_type_bounds since the MSRV does not support
    that on stable yet (Kernel test robot)
- Doc changes and add intra-doc links (Miguel)
- Use container_of macro instead of pointer cast in `fops_open` (Greg)
- Rename `Aliased` to `UnsafePinned` (Boqun)
- Make sure Data is initialized before `misc_register` is called
- Rework the example to use an additional shared value instead of 
    replacing the unique one
- Expanded the c code for the example to use the new ioctls
- Link to v1: https://lore.kernel.org/r/20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com

---
Christian Schrefl (2):
      rust: miscdevice: add additional data to MiscDeviceRegistration
      rust: miscdevice: adjust the rust_misc_device sample to use RegistrationData.

 rust/kernel/miscdevice.rs        |  78 ++++++++++++++++++-------
 samples/rust/rust_misc_device.rs | 120 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 168 insertions(+), 30 deletions(-)
---
base-commit: 9de1a293c8ece00d226b21a35751ec178be2a9fa
change-id: 20250119-b4-rust_miscdevice_registrationdata-a11d88dcb284
prerequisite-change-id: 20250418-rust_unsafe_pinned-891dce27418d:v4
prerequisite-patch-id: 25a01c330b680122836e386fe455a203b8c1f0a4
prerequisite-patch-id: 988474c343f8f54d296c73f6719c35e6b1e671e1
prerequisite-patch-id: 1d97c71229c1cd9c177a6346a4c846006f05f918

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

