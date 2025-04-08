Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C472266B59
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104261; cv=none; b=N6gzLabbn0WANBZvTWH/Bom5MSbSmXd7wsf4CsusmZBK5chbiiy/+obE2ryvA/ilGBpCzGk5z0t4co4zUjD9LL1jPtZf/Qzxgr9++hpOsmXRJ9vmCBIksrbeSMer1sXinsLfJ/5ONv1PlU0AOAx1Xc2EYeYNMuiZOmccJX//478=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104261; c=relaxed/simple;
	bh=m2/7sbOCWUMVifIeec7mgQC4DqxO7715a5mxnPiGobY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j8mFdZwUZOrCzqYGfLj1N/STDmEiYJmd3twY9Jx631q9iOlaKaF/DbhBKahY6iI/UXlm87u8eyV1WRFfR2gqIfoWjBtfAQ57oVkH15HZB/0eZJSOFfLcF/0q3AeOjGw+mCm7JIemDg3XYcn5m4jQKFRNmpQW42SLpMiNCMugoDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgsL14MU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgsL14MU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so30326365e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104258; x=1744709058; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIuImScQv8Fi6Jr5gBxEmMobPhodk5GrITEtyDe/zuI=;
        b=FgsL14MUrSNNY/o70yitmv78lTdvOE8aQfzA4g81slbdxLorG9ZWzpYVwwowO6Nu4t
         YAkxRTZlgxa1GskJyWDHUtT2fIBd+mYNofRX2ZfM4oc5AMZaNkmeVnb/Qf8ByoSssgm2
         oiFQ1yPOHDwHjIy5o49Oa5mqooxty3rT2HTJhmSANqX4VLnuvGoDzuqhmJFn488umBbV
         2cSn5nnUL6zEcpq8oZn8Fk710VKJ6Klo5oVzzXLCVcMy7juR3cYh5uGNqa/vEgyD2zQ5
         AKLqVOmAPZHXgthGqUirybWLnYD6LBdJFF95KKyG2YVDFllybKdEyPwJHNO0cuciEgZT
         6IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104258; x=1744709058;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIuImScQv8Fi6Jr5gBxEmMobPhodk5GrITEtyDe/zuI=;
        b=Bg8U4QDATvfzb703/68i4KqHQk+x+Z2mw5x+/OPZCUD6UCr1pXbcBeBnVfxdBPgUR7
         5QTYepX58ob2T1lbYWFEK+TiVIcnFWoo9kfpkb7OK/bq1HDpeLLkscxNxALkpWWb8Ze3
         U/CC7TX17LyZRIqDmHb0VA66KYqT6TcSIrbQIyPAhCJqO3tV8v6uNp0JlB/RNoVVecnI
         lMvMRwpGahxPQo3tK+fUymOjBR1eK+OCDAxkikQdvU1X6adC0If9Lu6RRVUZREx7BZB/
         N/eeF8GasyqMgHGwtIW7p2eZGY+bADiVC25cGB1lSiogclknEVXGTc8pVMw7z4l6ppBT
         VQNg==
X-Forwarded-Encrypted: i=1; AJvYcCV3NyI5/L8emf1nk5OFFpfOECCB3x6ifrRZZVqaq/+h2H15OAj/xDW3dvh5swycVp+t2hPe2qi97wypqtc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5mq9zeyyZbnZEspnGB2VtLdeN2Lqbc7K2gnPq2InuY1pis/lX
	Zps+pTGpIj5WIjG545/g2cS9l2A4nUfgJvwAKoRitjuK49lZ/CHs/VzJdf16wUDRJKMuaG5IxO6
	PdCpc0jEnCbhJ5Q==
X-Google-Smtp-Source: AGHT+IFWc1pMQ2RJ9ij6FdvJcqN5KNDRiADu9dL8SpaDl5jyOXZP0BgOscC21FHTrRxiw3z04BlYLCIylAI56hA=
X-Received: from wmsd15.prod.google.com ([2002:a05:600c:3acf:b0:43b:c9fc:b269])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f86:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-43ecfa06ab0mr117784265e9.32.1744104258002;
 Tue, 08 Apr 2025 02:24:18 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:46 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=m2/7sbOCWUMVifIeec7mgQC4DqxO7715a5mxnPiGobY=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9Osrq11PicKCteCb0qlte1JemOCFeETkH6Ll/
 cnSpgmrbU+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrKwAKCRAEWL7uWMY5
 RrTVEACTYV04bI/LPuLa9aALNkxEoDBC1dWns2op8JO02wLn1lwgfSVvYpy5ovBu+j7vTYD0Cfk
 KUPqzTfANnDnX6sBBckjHVgp/cP2bBFJFnVoad8EAP6vIWMqPkUSsNwI2la/g2vyhYzv7qnlWFM
 g2NZURTwzQq0Nti9cZ8V+IRWNHs8UqTxuf5exDhhF2CDeAj0ROwndmuSioqrSxy8knvimJ5HVrO
 dJUDn5oHKBvfmCsTMQtuhmuJId6JU53fD/sl2tZ539PAZ8jsfac57wvCxcrMs0HNtN4wdvqiJCn
 rTEU2gb91keNCTDfzqRHTRfPTlC5N6w8Op0vK/TtkdGOGV5llD4wjpDHc8i6ct7kvoTl1HD5yg4
 JRfP8ZALtRQ0sOBWDRG4ixtU/Ura42hA39xatzz8eh1XTz93SRWIelsc/fVkNKShyNgkCyWPpvp
 gPdQsJhF53ztGLMGDq/if2wtl6qKgcRJPHLRWkkFoWjwb69a/OTOQ0mRopSVJxJxxoXVfwv6iFP
 oBVwj/tXju7f3HDpnlhvi3NZfB4/jTLdhRY+XEbAFM4OB7kLCDwocD78AylKcQGM4WLhCWURRSI
 f6/u0CZ1ihQ2vnm3wUGgHBg9TVIJH07635glB9apUJ3aiJZXV6QilE8pJDxsSnyO4NbSmdImtqn EsSKTX6/hCNw5oQ==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-9-d8b446e885d9@google.com>
Subject: [PATCH v16 9/9] mm: rust: add MEMORY MANAGEMENT [RUST]
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

We have introduced Rust bindings for core mm abstractions as part of
this series, so add an entry in MAINTAINERS to be explicit about who
maintains this.

Patches are anticipated to be taken through the mm tree as usual with
other mm code.

Link: https://rust-for-linux.com/rust-kernel-policy#how-is-rust-introduced-in-a-subsystem
Link: https://lore.kernel.org/all/33e64b12-aa07-4e78-933a-b07c37ff1d84@lucifer.local/
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b82704950184bd71623ff41fc4df31e4c7fe87..9f661903723556a309434f83251caba9dd3e0699 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15529,6 +15529,19 @@ F:	include/uapi/linux/userfaultfd.h
 F:	mm/userfaultfd.c
 F:	tools/testing/selftests/mm/uffd-*.[ch]
 
+MEMORY MANAGEMENT - RUST
+M:	Alice Ryhl <aliceryhl@google.com>
+R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Liam R. Howlett <Liam.Howlett@oracle.com>
+L:	linux-mm@kvack.org
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	rust/helpers/mm.c
+F:	rust/kernel/mm.rs
+F:	rust/kernel/mm/
+
 MEMORY MAPPING
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Liam R. Howlett <Liam.Howlett@oracle.com>

-- 
2.49.0.504.g3bcea36a83-goog

