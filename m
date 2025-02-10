Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59A25B66C;
	Mon, 10 Feb 2025 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210160; cv=none; b=j3UWBfk0/ecsg5TYgQMOgiQJEQpS5eO7LJiVmByoL+FEdy9fQIDcj5MHN8IZOL4zBb9hR7jUu/H0BvQ7SG/zdO5U00B0+F7WQRegvS1kiJ7r/CtkMlpqEAjfQRP+luIcWts3sCBYDqABRXfBn2KqShbulFydTqnl9Ivg6r8NwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210160; c=relaxed/simple;
	bh=pa8c6RQoLLyXlxCLaRmxxhIKjVDozhcvcaDQotwr6Ao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y71OT5N9zSasG9jrZBa0Ov1XC4Wn8GcjLUNQ2IArvA5gcHsHotv6Al5LKDmPxFTpxF7lxeeuvX4ce48q/gnLWQEWty9Xwr772Ups0GMkXNsJXx0ajuUejbYT3ujYx8IVYC+TxO55tMgdvDrsgQeS907WsGR+iMWhjRGnWTPxMXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIiCN4Ul; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIiCN4Ul"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c04df48a5bso190160285a.2;
        Mon, 10 Feb 2025 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210158; x=1739814958; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LNp6jRGPNyLv5CD502EwF9CXCLhtEUzDxpx3t4dKjtA=;
        b=XIiCN4Ulfrt+GqINLNHGUq0OMb2VD3cJXMMuF1tCu65p75ApQ5MvXll+ebkCfURNxq
         qTBL8nO1ANlypLpxzZw035z/0x/B9asQUic0zDw5qvbKe80LWIg7EmPA4coB/VL6AmW+
         ZjwESBk9ItrjRWKYObPmaQEEzg6dCze0Yhr4ZJnya+l7mpXc+l3jSecwVTsJpEA+tjqP
         3ZfVx52/wJNLKJHpCL2vCFsy6f+a5wsYXrXgnPy+nAJQb4Eon9VUaonAFLVi2VPid52s
         QY9tO7y2ospYZsoh2fx/EQBNjxVIGBLmaSUJYV476fQMhoAoKeUiJgA27tT0fhrGysu2
         1k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210158; x=1739814958;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LNp6jRGPNyLv5CD502EwF9CXCLhtEUzDxpx3t4dKjtA=;
        b=Toq9r296mCyBfEvx5tMvox+cyZdjNt6sP3Uz8LB1UkLFMR7UXvUK5d1ejIl2I4kQpM
         2MHK3MBOyxU/I+9yQbmnAM6iNbFjM8LfC8iC+X9KynE9wQffOXZWIn9rp4PZfpoxK61F
         WGRTx6ukax6nal/4TjyiQ+QLuzoUnGgz4PNhPW1yX3C75/6bpJ9j9J9E3rViaR9ORKNg
         bdwf6PyLuy1j7pKhTZ4Tz2epjPYbQKdiY1Nl2FEIh8esbPrXCE8fspM1ZBPZFxKpTazh
         PQ8ZCk9/zxC18fDgQxhdxZdlSrloag/yRucVvgfD+qFwk1CdRX6XKIjf1VgwGQ4j/YZt
         goHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBCwWYpemDcFd5EZAvWeBF1yo0eqnT0qd+9LvuRjt46aOtUOzQbV/wleTRKp/iPKdR+Sy5ZkSJZ4N/jjE6ZjM=@vger.kernel.org, AJvYcCURi+C1XhQEumMN2V0EJosxw4/d7iQFMi7VrxnLOXfDyIcxz8efXTp2FK1XPjducdz8kjUWXBVKtM7Oouc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCJEHQ10UzY2ZP1EDWeeybHhQGRJr3p6Ib0t+TW8QCMt09M0h
	RmgYYf/f/4rcKsVv3upozkXenxRjltvd+MTDkcCrXOJ3LrXw5T1C
X-Gm-Gg: ASbGncvqjGz/sIdx3BKqAqKl8T9ZLIV8u6ItcmyM9gxDvczMwS+z/gd2SC63e/rG6LB
	TqR+G2iA5PuHwx+gmUKlbkJu6H9cZ9ArCzIXidvgeF7ZHBjukz4N5j7M1cOTFkj9edhDum+vfdE
	3yu5U97MdRR96B6J2n96FJU5t8w17WM0B+JgN5T7oum8lrpd4FC4lcJcP/WbeGwoRQgzkoUfxxZ
	qn44bZD5hc1ymtQoCMqTpoEqQUKfScUREKM4+9epwJFFKxEKgsPhDvLOtO666QKTOWcajv8gtb2
	PExJKaAs3FHQS9q+rn851jayUMxtUuNYZ0tftvlj5MKBfJhCj5gfJ1Tz7z49RtLIEBeJNPgEOFK
	faveKdL2NOWKC3z+oDMhQHXe4
X-Google-Smtp-Source: AGHT+IHUEwWo4ozUI/K5IhcSuE1PQxELfUOYGSVHUS+Pc68tvthRAYIvfXZ73ff1EyUHKjHzPT54zA==
X-Received: by 2002:a05:620a:430a:b0:7b6:da92:fcdd with SMTP id af79cd13be357-7c047bba8a3mr2101799385a.15.1739210158219;
        Mon, 10 Feb 2025 09:55:58 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e11d19sm548788885a.52.2025.02.10.09.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 09:55:57 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/2] rust: fix rust-analyzer configuration for generated
 files
Date: Mon, 10 Feb 2025 12:55:52 -0500
Message-Id: <20250210-rust-analyzer-bindings-include-v1-0-6cbf420e95b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKg9qmcC/x3NQQqDQAxA0atI1g3MjAjVq5QuppNUAxJLUqWte
 HeHLt/m/x2cTdhhaHYw3sRl0Yp4aaBMWUdGoWpIIXUhxYC2+huz5vn7Y8OHKImOjqJlXomxayP
 3lAuXK0GNvIyf8vkPbvfjOAGtmkHDcAAAAA==
X-Change-ID: 20250210-rust-analyzer-bindings-include-531e9dacec8d
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Asahi Lina <lina@asahilina.net>
Cc: Boris-Chengbiao Zhou <bobo1239@web.de>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

The individual patches should be descriptive on their own. They are
included in a single series because the second patch uses a function
introduced in the first.

I've confirmed this allows me to navigate to symbols defined in
generated files as well as to the generated files themselves. I am using
an out-of-source build.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (2):
      scripts: generate_rust_analyzer.py: add missing include_dirs
      scripts: generate_rust_analyzer.py: add uapi crate

 scripts/generate_rust_analyzer.py | 41 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250210-rust-analyzer-bindings-include-531e9dacec8d

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

