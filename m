Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF7267F44;
	Mon, 12 May 2025 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042073; cv=none; b=QQy4LE5mjmQ7otIAHD+luCTTSidbg3IY3NTr31A5iBaItBaGtxiX4GalzDLCl+ZOTNF0WTDPd6yFIuSg03Uc9sTYkx+K1Azi1W4chMtp16L/RRmyq5CdXtchMAnSHTM9ZKfTQ+VF0Jefp09NubVHsYTFhbabYKoANRCHJihFepk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042073; c=relaxed/simple;
	bh=daQmruAQAI8gRPt/6goQ02a/HIENBKV5TCpMi1jKuKM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lugs2zG0nIsOyYIKBLMsysEwR3iK0uVJ8oNaB9I9lP40+tJQE/mSXGfzhJ3KWdAqEk3nJtcToJ8FQNsjYaKewJdDjuJmsAS+sMJrF0mpW+2ZzAvomZrcJz47pwIXAL5gGpUdK82PUh9blQ3Lh9SAooHIpk8DdHcBHpjcUk2Hb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSfeU+Ol; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSfeU+Ol"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fbee322ddaso7889503a12.0;
        Mon, 12 May 2025 02:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042069; x=1747646869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lCCYqSSDOknXdDD+W0wbgP1Fgi8UCHS+A7wnJsRnVQ=;
        b=CSfeU+OlPO07v6yQU0sJMb6DimjIIvsXZDeIfj70psReZW27pynSxBjn+GATwCB+E6
         MDeBJwiWyozHZtujqiuPJyOV2dyhUdTyfosYNhKUk4UT3kR5HpJKwJOEgVQ37XQaa/Kr
         kpKcZ1sshQzlP5+wMmsMIcD1iTXFFUQQsEUn4z58yA2j49OId2Y4AocZsZiuLzIZu6P8
         nh1SKUh1L0m0km67Xpmx6LxepBcQFmKfuDp8REeDLPyWOTMm7sz3xWne0ULtKy4TQkNE
         Pf6yghIFFHUZwtwN8dvAKEBXVbWISi3gubee5YCdGGFOMcF4TQbzpYzI9r4zaRKot/o3
         rz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042069; x=1747646869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lCCYqSSDOknXdDD+W0wbgP1Fgi8UCHS+A7wnJsRnVQ=;
        b=ra5cK/X7/quPaaY9mS6vaJWHubRXutcmgSheBZFy0Qc1n8sXhd9Qtk3IcMgzubJtiN
         iSBHYmiKMMdT93TFQgfbykMmrQjkdWI/5wiZDq94noZNOJteHTyvk+N5cmL2lgwjINOJ
         hohh9kGPbm+YldP+uGkaGvK7/6tdsKg5l8XV3ZGB3Y/O5xUvp+tLp83aa9YewA9THb6b
         ZdfuErpv5vTOGse0fAhMiw9HPaIM7C0HMGCbbbJXe3wyBqfyyjV0mciwVzRvlPrarTcm
         AMLvWnXFyWff3+qcscnYRQFrueHn4rZ0gD0kozYzlIuIzZ0ooIa8z7dwo7Wj985xeaw3
         judg==
X-Forwarded-Encrypted: i=1; AJvYcCUpaeVpxOeAs5z5eCJSuntqw4BpGi3TbAivFRUalMSIkwrXYxvZ/Kn3JUkd/qBhB2nN9J+16eV1JLCV@vger.kernel.org, AJvYcCVbVtvIDKjn0Xcg4rIOTBUiLngXkYP7vkBO1RCkS0GkzxkeNkk1hxNxVXJIg4zL0NgzbyEfN0rZUKHF@vger.kernel.org, AJvYcCXAmzZY1+AvVR3qSluv/tTT3nDQSUiwOyMRhEckbLp7oy8kWgw3dwbTzTm+MWhB1Lg9VUSP/o0OA7Ha2ii+@vger.kernel.org
X-Gm-Message-State: AOJu0YyagVAA9btnk1flRdkJ8Z+4KvmI1Xh4vJCogfiQbB8olxE8CU2N
	pCS2TlGBChoQE+8Wbhwval+mec5jvp/x6AfzIEEgCk3MgFmHZoqspmvgw7rTFQ==
X-Gm-Gg: ASbGncuYhP0OjFgjXHG/gwPgzEVukmoZeTz2E3IG/1K/Ojjm5r3LDx6D3Mr6oBT++LE
	8eyAJxFL6rBpOcw42ebpu5liqeWhfQT87hDSAOavGdm2m7WMpgBOJ/gBVihBHbSynqgc4eJQdB/
	7K/CL+k5rqdlHEOajCW/QUlhF9Sn3KKg1Dua9AZdRJCwylR3mH1GaMh1Xo36t2J78Mbd1U7toc6
	fYHjbhgviqIMT2NQzhE+bJSv40s5e9cWOqeee1FrxXQNtWfVzljauk62ZUx+YJ0pkp/2zAsEgwd
	EOcB3w0kGRbvlKGVTwRM7mIJTsYL4O5KumLRqbICF3upKYeKylBsQZor
X-Google-Smtp-Source: AGHT+IFGCB1qaH/mNnABT9Qdsc4NUqQKYY0073rH6RsL7N0wJygie7S5IY08v+IN8TKTRd1Y0fiP6Q==
X-Received: by 2002:a05:6402:5386:b0:5fc:a3df:9469 with SMTP id 4fb4d7f45d1cf-5fca3df9987mr8177705a12.29.1747042068431;
        Mon, 12 May 2025 02:27:48 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26483sm5480242a12.22.2025.05.12.02.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:27:48 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Abel Vesa <abel.vesa@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v4 0/1] Add Parade PS8833 Type-C retimer variant
Date: Mon, 12 May 2025 11:20:27 +0200
Message-ID: <20250512092745.249293-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce PS8833 variant, which appears to be similar to PS8830.
Present on some Snapdragon X1E devices, eg. Asus Zenbook A14.

This patch is part of Asus Zenbook A14 support series [1]. Resending
1/4 separately, as the rest of abovementioned series either already
landed (2/4, 3/4 in qcom tree for 6.16), or awaiting for this patch to
make it to linux-next (4/4).

[1] https://lore.kernel.org/all/20250426130203.37659-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (1):
  dt-bindings: usb: Add Parade PS8833 Type-C retimer variant

 Documentation/devicetree/bindings/usb/parade,ps8830.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.45.2

