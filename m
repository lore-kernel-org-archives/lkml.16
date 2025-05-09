Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73525F792;
	Fri,  9 May 2025 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746822888; cv=none; b=tqBnXZAhVDXqQG+CIO3OkSj8jczLqXDH3t8rwNuqn/LHp+Y2ktF5i4chJdapL8Lqi509dT8lJnIIuhi3rUFdtmcuXn7cQ1DofMsYD0F5tJKLoSn/0YUUelTHnxWTipRJgVEsfUPoZOsYPKa8HW+W3CHVAuAu1p2k4BWqzJoE3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746822888; c=relaxed/simple;
	bh=IoNLw1aOwx5IbcamgzEcj9P4jGAzaQAW47XMz8V0xXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLO8Zalt2qLfuo+j+FyAXc0+zbxHvNnRZyKuWiK4Xc+iYqWDygNmbV35vFOEWbpE6rx5AdczOTnCOjQ+TxA5AtaRdPJA8CpZvSQWyFEnPOhJvRaxcCXde26SOkM1o2MZd29amW9981vcQ3f24rAKxLvgLPyWTpJc1MXvLzuwV8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5GBUqnB; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5GBUqnB"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-acb415dd8faso422370566b.2;
        Fri, 09 May 2025 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746822885; x=1747427685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jn0mQgbwIKI0yXWXrQMmSDlanoxwH9IsJVP0trltX/o=;
        b=E5GBUqnBReEUrg7M29QjDbPj5ZMZkiPRAZu/RFqxPaoBKH91S2Mj6sryTLyXa7w+kO
         Z8jjWT9pAppwq1NQDV2/rgOJBPcjUWKwEGaFn53RC7fqhsQu9hmmzy8DA5LlA+kXLqn1
         ia5bcsk1uvU3bMCzeiRek4CHMw+9Be186quHIId0PdAJvnXxRtZxUetDEpAi+OvnXpw6
         aFQ9gYSSAuF5wlqSVNGEl+oheiOijoWrrKJ46n++p8JQIn3QC9hW2lq2R18MpJYicAQ1
         YAUP53Li/ruURW02HHUZ/Ad3loguvTSDHipM8ZORqUny2cI2KOtZkiuo3DiI7tB7LIM3
         ubrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746822885; x=1747427685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jn0mQgbwIKI0yXWXrQMmSDlanoxwH9IsJVP0trltX/o=;
        b=jW5Q2ehQ5SI9yEJ5ZL95B1OmZ3pU36Sq9ESNxcdRwS2nCFZ6YQZ4qb/u6ilglC+Lid
         o0iwtwO74A1jHC2GBDPSCAfc8BCpufm+Oh7aWGNJTZjKSY3ZauC0ea3q2e42q2xhjq1P
         Kb56QsdxBYfCAXahKzU3d099ZJovmbgkKY3VELZPD50WUD36FE9ZHfCtbC3AR2O7K7cN
         IrnAMbTPJ7Z75VO5Cosl2zzhBVkhNnhVyJ+A56lq7iBwCsDWdfN1oyjlgvNEIOp0cdLu
         qNUVYAZSsqqiyB+caQHQ+7vKKEW0bLy2EcH15TT8lUf4/a7M7NvkfbqwxMXiDqITuIsb
         c9VA==
X-Forwarded-Encrypted: i=1; AJvYcCUorFsXb6EUBsc8d6v2+ot8Z7pHiQSIJHiwjz+f9Q0HQIUfThXuBUYRxjJ/WAU5/Bjbf7MxVtXCUUP3MV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxElK1COUQegJO5+FcHriHHjhBtXV0lnfILRF6xf8k2W0h79hdm
	31zfVP/Jg1UOX4ilLu5YWZ7Ra8o4rC0kIgPexxcTakVkFwpKP03r8tAo
X-Gm-Gg: ASbGncsxS7vdJt0DkxBi/e6D59fHx+H3CVOOE44XMkgtm9APeyjtEvWMQDC0oelK+FS
	mSzSXWIwMugSKOQaY752AK0CUrIpQl+YaIVK1dX+g/fneVj/QDVP048BAWr/k55b6fXApvGRzP9
	OU+EWUM6thT68OldKsZtsUHs7ufI7DjR8maOkYyIVYT3OXtsVS/kwtlXHnNri/21ho/J9fHcxxK
	03GLJSSokAW9fBOpczO4deoAPf3DLm/Ix4aJ+FBdTMiAiATj2bzOzmPtLYDJZjumaFs97B8IPxV
	vZBmNiqctY6ADurfaYNEusH6IKSqIF4HlpKtrLnRriAelAGp4Uer+b5UM1SJ
X-Google-Smtp-Source: AGHT+IFlPURGNvT6TRGB9vImkCVDaW+TguoD6iVGw/w1ysOADK8GhDWlIuypNt764A42pCoSdTJu4A==
X-Received: by 2002:a17:906:620a:b0:ad2:2d74:a1b with SMTP id a640c23a62f3a-ad22d74107dmr147591166b.45.1746822885264;
        Fri, 09 May 2025 13:34:45 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd219sm202255066b.141.2025.05.09.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 13:34:44 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>
Subject: [PATCH 5/9] CodingStyle: institute better inline assembly formatting
Date: Fri,  9 May 2025 23:34:26 +0300
Message-ID: <20250509203430.3448-5-adobriyan@gmail.com>
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
 Documentation/process/coding-style.rst | 40 +++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 5c5902a0f897..63c41125e713 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1159,16 +1159,42 @@ You may need to mark your asm statement as volatile, to prevent GCC from
 removing it if GCC doesn't notice any side effects.  You don't always need to
 do so, though, and doing so unnecessarily can limit optimization.
 
-When writing a single inline assembly statement containing multiple
-instructions, put each instruction on a separate line in a separate quoted
-string, and end each string except the last with ``\n\t`` to properly indent
-the next instruction in the assembly output:
+Inline assembly statements are formatted as follows:
 
 .. code-block:: c
 
-	asm ("magic %reg1, #42\n\t"
-	     "more_magic %reg2, %reg3"
-	     : /* outputs */ : /* inputs */ : /* clobbers */);
+	asm [volatile] (
+		"insn1 r0, r1, r2\n\t"
+		"insn2 r0, 1\n\t"
+		: /* possibly empty output list */
+		: /* possibly empty input list */
+		: /* possibly empty clobber list */
+		[: goto label list]
+	);
+
+All keywords are placed on a single line.
+There is a space between ``asm``/``volatile`` and ``(`` so it looks nicer.
+
+Each assembly instruction is placed on a separate line as does
+output/input/clobber/label lists even if they are empty. This is done to
+a) prevent unnecessary reformatting if ``volatile`` is added/removed and
+b) to visually separate outputs from inputs from clobbers, so it's easier
+to understand what's going on.
+
+Each line of inline assembly statement except the first and the last is
+indented by 1 tab relative to the initial ``asm`` keyword.
+
+Each assembly instruction is ended by ``"\n\t"``. It looks ugly and distracting
+in the source code but keeps formatting of ``-S`` output consistent.
+
+Very short and simple inline assembly statements are permitted to be one-liners:
+
+.. code-block:: c
+
+	asm ("movdqa %%xmm0, %0" : "=m" (*buf));
+
+Those are usually 1:1 wrappers around single CPU instruction.
+``"\n\t"`` suffix is unnecessary in this case as the compiler will insert it anyway.
 
 
 Conditional Compilation
-- 
2.49.0

