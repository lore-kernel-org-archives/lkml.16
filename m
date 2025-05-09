Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA509241663;
	Fri,  9 May 2025 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822887; cv=none; b=Z8mbu17O4/4fR4fCXxgFHpWWqKdliQynz1zwTodLQhd/j7LQBnVdTVfVTW9YlWPkV9DHfAZCgglGWOzFaY8WUT/4BDGwjZLIGWg/yUmtnP8v7JjlXqIXC9TjfPkcYO9CxD9tWM6jDJgcOpocBwJ51oDXelmSvCDw2BZ7yEUcByk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822887; c=relaxed/simple;
	bh=wlRcT0JjlXvrAK8bj50yGk7CQV3LahHQT8tzVhYbJIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrbeowTF7aHfO02vc+71sw1sZOIQPnZvvS6mzwtTOtkos1NoK+1tDeTf6TFv9hUF+1VgL9DgSDohGo8AOCo//3omNc9A0oTxIBgWWJG2WnJQzaYhAO5217Tbm7GHENmlhCCkJDqpEjBlzX/quqnGi0s500QoWqIGQZTcg+qtMbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Stj5DBe6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Stj5DBe6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb2faa9f55so322101766b.3;
        Fri, 09 May 2025 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822884; x=1747427684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sUha4zBH3hq7MlDEpX8wKMDmKjyJUbo8AaG9MdPssY=;
        b=Stj5DBe60+jtX+HQb6f3UAcNoB6Jc7HLPdJJozgp5fFg8W0qo50T/v45Sg+rJi5Qg3
         B+zqGAb519q2I9IOw4lFk/VLCmckR6WqcGIyThLGkwl36KlS7x8+pcKtQG861KAapczS
         hA8nRs/0MHnKH+ZHSNw0Dak1BN7ZcJSV+zHujmV3oO03U2CQJkW7punX27X3eqJa6MJe
         OXmHmKpYQW7wXUmfAX7EwPALQhoqNO0d8QuWxkdf3bK8xo5UAecmJtNKkxrgzTy1OQbR
         6vdS8L/FkyU1fggeXEiNgQ80/MlEs6Yd41aHT8siTDMCiPOEglUNnKjlWdKK4dkorWZS
         o+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822884; x=1747427684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sUha4zBH3hq7MlDEpX8wKMDmKjyJUbo8AaG9MdPssY=;
        b=BUp5bgxDeoKslFNX+d0dKiP68TioG7D2ynPj2A9+eYq2O2lMM9kvJYqPpTZdIANTys
         ZPIgLLDsRBjP0wSxhEJSWuwcqkNp6nYTr6t2eTYaRd2PKJ7Yar8KQq3+cyFExv00/517
         Oa9xKaQYIMfb4UEO6oVnUn8EVGpmbLpNQyQ9W+EIHiUlg6v555mOKpgyJ5cDMOGzYi+O
         cVrPAvUAUCfytPBTGBD75SogfW0i6qU+/qPTxZI4VZCxC3bQqG5I2nZgI4J+c+OuaeWW
         lFmIT6M2pASZ0MxsHUyiBNyL0tdYQspmlyX0T0O6jTyyBz5pLJ3gk2OjcPcIi5Jl1YGk
         UN+g==
X-Forwarded-Encrypted: i=1; AJvYcCWxmfZnVSM5Xp5J9GDP4GvihQGcLXpDOk/nyvrUyCHDdQSm9gWSHfdpzCzZhiWGDveY61Pi+HYy/wUoscc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypew0bKbdzY7HJev7LT8i0T9oYVXlVl6agObNROHfBdk3WE+BO
	1SGU/pqVXYn5XydUlMuXZcHS4+0eep9Z/Pl6IOsn5XTGVIfupiPEL4kX
X-Gm-Gg: ASbGncvwoljnbUX/V7BbQCoMbSNfcGofKL7sb680zJPZ0f50Cxwz0ghJyr3aM1PePmv
	b64ZIPOMX31LcPW907Kd/mu+n5N57OTQqe47sRLDHnT2W42whPKN/XrAGkwq5S3ccR7d6pgvQK8
	fJlWMSwT7LAnXHyC9StQHew6mkNYi46YNc+Ym9IMtQFR7Af01RERQiTsQcZ3xv0Ea23V4C5N3Ki
	hVkLonaJiw41II6gKTqvxeSu3y8Q7JU6ImcNZQ+4b913wub27UPEd4An+n1oryxTbEKup/2eP5a
	t6vJSEjhqxLErcLxK2jKb7+dOvMdtWzTypQdPThugdHVX3sr6M/VRhrBnVIe
X-Google-Smtp-Source: AGHT+IFdDKFvgYW+84tDYFjBOZyjBbW2P1aFPvZvK3aHpCK5BD6AOadeQcfP8wOJ4AE6J1RxxNUuUw==
X-Received: by 2002:a17:907:971b:b0:ad1:e679:74e9 with SMTP id a640c23a62f3a-ad21915de32mr471735666b.46.1746822883880;
        Fri, 09 May 2025 13:34:43 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:43 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 3/9] CodingStyle: advise on using "sysctl" in sysctl variables
Date: Fri,  9 May 2025 23:34:24 +0300
Message-ID: <20250509203430.3448-3-adobriyan@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250509203430.3448-1-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index a4fbe45c3eb9..ac9c1dbe00b7 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -356,6 +356,10 @@ specification that mandates those terms. For new specifications
 translate specification usage of the terminology to the kernel coding
 standard where possible.
 
+Variables holding data exported via sysctl interface better have ``sysctl``
+somewhere in the name. This should remind developer that its value may change
+at any moment unsynchronized with the rest of the code.
+
 Typedefs
 --------
 
-- 
2.49.0

