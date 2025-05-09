Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F54225FA06;
	Fri,  9 May 2025 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822891; cv=none; b=sdng+anW7WHriCSCjDQFz19SF36hg9EBUJ5p+J0rWiSgyO6WdoeP0xvB/HVWh1PZ+Vf6m86n+x9KANFUJiubXYpuQjWWbQeLAJ0WiWrA1gBfnvaRS2f+TOivoYbqnT1r7WXgT8KwEiZE6KiGaJNIcE/65VS3DZRKOzTKYaGuw7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822891; c=relaxed/simple;
	bh=znIbbPc5pvsMHNW2ha1w3lk5m6KgVqpV40O2pf1EZp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqA40ztOpIjMjSqUHmoKAA9zLgAK8DebDUyj7HwUX2tPYmEVjURD3u5ev/unON3YZ8f8TXCy8ixPI9guo1P5GCHZSpPNu5Lv7BQ/Xs9IR4LCdK4BP8Wsjtf0qiSg2ln0jOQctoMVozxpFXaX3lKnRb/yQ1FN+2m8AyKgO8p0R3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+GDD2dB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+GDD2dB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac289147833so493815466b.2;
        Fri, 09 May 2025 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822887; x=1747427687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ai5A/nfYwBt5wQZHEzuVJM+sVLGsRCRXreL+tkgWKO4=;
        b=a+GDD2dBQ+QeDUZ4JtYO/O5+fFVae2/6TsZdg1RXWaezDAUCM4p15hL38ipZ5v7WP5
         6n0uSGmINqWYG7Hgpmz7j/5nh1xev4ADD47ejcYLH67Gnxg+TDMeNm4LQt76yCSqMdzA
         E17WghQXSQF5ZscCQFjoVt5MTE6XnC+K6VHffRzzJk9GmFmncw5F0fq7tAaxZi2Gqs1O
         /9ZdyNDtE+hjZ7bn93QsFaMe37+wQlraZPCQ5yAtoRq1nEDu+J66n5AvcOFFuNV8rPES
         W2Xp46gSTUXSiyK0p75uij+VoonCvMnuy9lTS0l5piF/2/zc67aZVPjM0Bx2utd/J3Jg
         aD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822887; x=1747427687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ai5A/nfYwBt5wQZHEzuVJM+sVLGsRCRXreL+tkgWKO4=;
        b=uKNqFF0BNzzmNweQYrefxDIGNL7eqhCIYyKw7Vwu7Xs2MHUw01F1vqBoEau+8FCJsF
         8sFpiD7MX2r3NoTST30nfqN3kCNJsazTHF/w+1xVCd0v4CY2O1tpYFFAHmBkrB3juBW2
         0AXPQubeS5I+jN+bM5N8nJbjoowS41Osf4NPsUXrtLyAmA9UUvGocyJVps38tI4h0DXB
         s69girhSRJUudOBH90QRr9aUys6Ia6soOyZu7Ed7rZypDaSK7cJeoqliN1VPRdJ5S0Xp
         EOf0j7BTtplbojZnoW0l8fpphDMb7aqZjE2BOhateL1JOvK/8BFWZ/GlqXlWQZ5sR32P
         eVIg==
X-Forwarded-Encrypted: i=1; AJvYcCXURhjE0sHAVvGT2xifYBWfk3yzbAPvmYUJRIUMKM4SH+b7swOYE68ooRiGDvkY/t1Nn+FTAW5BYrz4Hmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMuB64i53gF5toF+9+ciRWBdOQ7Lj27mzlfN52yWvmX6/TCQiy
	J1S4IPLoLpzRMGGs191+G94xoaVu1RaYHtz+WK+Xugecdx9Hk6o=
X-Gm-Gg: ASbGnct3Cb0YUtLPeUfcMuDCNmyzYxjtD1nXREYpQELRv3RN9pKXBpwav61cbVfYRxt
	iN2qvF42lBk4pDmhXVFDoFLNIO8mfvj8sA1bI0WsV7k7NREEq4ga3l/1E2EuoSefzzLKoIHp/mP
	vN8v43cCDyoTcdkBxyxeJ7a5AMjU3kPnnQH8xpyInqMpr98pXKdZBXssf2Vt7o/lqrqLKQ5GZBi
	kbLMw/mwsC2m6ME/DdhyAW6NFqw2yTwNWlVzU48G83rDGOOH0Wvi3bNPbga4zPqHd9duytRh//A
	N5AMBoKSvwUp9+rL1xv7lFC+ZL22p9DT0o61XjwrRuHMrkRl5cpkYzlV71gn
X-Google-Smtp-Source: AGHT+IEAWoepkRR8UwIH4i7kg7nIPy/+RL4fvKNWZHaWd1Y2hUNL8xqwjs8AMZtpYAWv2l1Q9RRF1A==
X-Received: by 2002:a17:907:3d9e:b0:ad2:24e5:27c9 with SMTP id a640c23a62f3a-ad224e53132mr285709466b.44.1746822886756;
        Fri, 09 May 2025 13:34:46 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:46 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 7/9] CodingStyle: new variable declaration placement rule
Date: Fri,  9 May 2025 23:34:28 +0300
Message-ID: <20250509203430.3448-7-adobriyan@gmail.com>
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

Linux finally compiles without -Wdeclaration-after-statement allowing
to declare variables anywhere in the code.

The rule is that variable is declared as late as possible:

1) it is possible to typo a variable and use by mistake between
   declaration and first legitimate use.

   Declaring variable later decreases this risk.

2) it is possible to typo variable between last legitimate use and
   the end of the scope.

   Declaring variable in the innermost scope decreases this risk.

3) declaring ALAP (as late as possible) often allows to merge declaration
   and assignment into declaration with initializer. This saves LOC
   without readability loss.

4) declaring ALAP allows to use "const" on the variable if necessary.

   Linux doesn't use "const" much outside of "const T*" but with
   split declaration/assignment it is not possible at all.

4) declaring lower naturally breaks some misguided rules (I'm being
   polite here) about declarations: there is a rule saying that
   declaration block in the beginning of the scope must be sorted
   by length forming trapezoid-like shape

   	XXXXXXXXXXXXXXXXXXXXX
	XXXXXXXXXXXXXXXXXXX
	XXXXXXXXXXX
	XXXXXXXXX
	int rv;

   so the code looks nicer (allegedly). This is misguided (still polite)
   because code is formatted not for of objectively good characteristics
   (bug risk, codegen quality, easy of maintainance) but for subjective
   qualities like being aesthetically pleasing to look at.

5) K&R rule about declaring variables in the beginning of the scope is
   pointless restriction. It is very obvious after programming something
   other than C. All popular programming languages either never had K&R
   rule or discarded it at some point implying that even if it was
   useful (it wasn't), it was so marginally useful that everyone thought
   it is not worth it.

This patch makes 100% of the code non-compliant, but, oh well...

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index f8d5151eb0d2..e17de69845ff 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -95,6 +95,78 @@ used for indentation, and the above example is deliberately broken.
 Get a decent editor and don't leave whitespace at the end of lines.
 
 
+Variable declarations
+---------------------
+
+Each variable is declared in the innermost scope possible
+where ``for`` initialization clause counts as a scope as well.
+
+Inside specific scope each variable is declared as late as possible as if
+declarations have "mass" and "fall down":
+
+.. code-block:: c
+
+	int f(void *priv)
+	{
+		struct xxx_obj *obj = to_xxx_obj(priv);
+
+		rcu_read_lock();
+		int s_xxx = 0;
+		for (int i = 0; i < n_xxx; i++) {
+			s_xxx += obj->xxx[i];
+		}
+		rcu_read_unlock();
+
+		unsigned long flags;
+		spin_lock_irqsave(&obj->lock, &flags);
+		int rv = obj_make(obj, s_xxx);
+		spin_unlock_irqrestore(&obj->lock, &flags);
+		return rv;
+	}
+
+
+These rules minimise a) the risk of variable misuse between declaration and
+first legitimate use, b) allow to transform declaration and first assignment
+into declaration with initializer saving LOC on average without readability
+loss and c) allow to use ``const`` if necessary:
+
+.. code-block:: c
+
+	T a;
+	T b;
+
+	a = g();/* bug, should be "b = " */
+
+	a = f();
+
+		vs
+
+	T b;
+	a = g(); /* compile error */
+	[const] T a = f(); /* OK */
+
+Each declaration is put on its own line:
+
+.. code-block:: c
+
+	T a = ...;
+	T tmp;
+
+C allows to declare multiple variables in the same statement but it is
+a misfeature. It leads to confusion if pointers are involved, even more
+confusion and long lines with initializers (likely going above character
+limit) and avoidable changes in patches.
+
+Very long declarations are split after the ``=`` character:
+
+.. code-block:: c
+
+	struct xxx_obj *obj =
+		xxx_obj_alloc(Long, list, of, arguments);
+
+Most of the time both lines fit just fine into the character limit afterwards.
+
+
 Breaking long lines and strings
 -------------------------------
 
-- 
2.49.0

