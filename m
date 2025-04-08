Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBAB17CA17
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119147; cv=none; b=E2tL3/cntdNi1UwGoD758YKuUmD/bMv+sXSp++MYpMoGgX4sCAyEfKK0pDLp8J0jd3TwfuaENalprt2w4lOF6S7Ars5VKWQkPhGvBeprchBdRn1F0sIXCO5AjQ71QK1UhoDvbJuewtqXicmE9W0SlIONBuve1/umWGO6itk5dUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119147; c=relaxed/simple;
	bh=gMn5sT6YHlhINbVg1JhdIXBV5Svve4/i0YWieM+ToWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KleylZTFmHbbLvbm36AHKjRng11APT2D+GyQqUIycIvzVsuU2AkKPUh/dVakVjmNgHpw9EUlAJAb/0Lh82gchhEA+06gEl5gIqAPvqoLZTbCCCE2QQHv6lMUUW6rimiVq6cpWylqiQ4qU6WpSEQzKzpAupHX9SYPLqwOdberFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oizx0cx3; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oizx0cx3"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5c815f8efso525827085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119144; x=1744723944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIusQuGgX2vGT68cDt8SEFqpzccdF2dU+sL7arsGnOo=;
        b=Oizx0cx3efsrhnzW+OIbnogeAVKrpkYjNjc19Zh4orlWzQwUVlxTTl5z8UEs8EJQab
         tUG6P40d05Cgu9WdYEW/V3ZFq9V56Lnk9ucB1tAQUJzSn2eTX5gctR8rWQ6b9SQBS9Dt
         nl5ozCfStH/qiRSdGbRphDfyEEZLXrW+me6+28D46mszoU7Dv9T+PoWZGDQK9JWK6RVg
         C1X/h8nPtZrq+GBLt3cBxfYFpPVsRki0YCmhgQ98yfretabTA0OsVDa/82JCL76ZNzrQ
         QYcBZ/Si/CReVRnqW7o5HbgfdL9DCEUDweQA+p8EUNg9UQjooWlIFSwp54gsxVxkjyjj
         fqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119144; x=1744723944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIusQuGgX2vGT68cDt8SEFqpzccdF2dU+sL7arsGnOo=;
        b=sqcGiom8I7SBecVksMkBCUDekUNrEJns2KvoFaiOQ/v15E5Zb+5X0oIEw133VRlysk
         CbveyCzgQYbBc34oQVT/FwqfZfOFnP7gXD2w9zfkOe2MQse++xko61KwPd65PPWGtACC
         UqCXGWVmEkEq38P7mUBvOqKrYlkRxMjkl7yC+JwbmPDfpGpipnEKnXTLS/lDHLkz4G5c
         3/AOgo+3vczoCl/pf/FYGIBeSpqbpokq1MAYffGqRGZqcTfnZsJhtGYaMA1jzHUfMHW3
         w+LGjmRwJsTdxf+Dkc95yr7X23iNqTQpPlGnoNhoztW5R2r5hptZfjb3F/jyme7vLSEc
         pkvw==
X-Forwarded-Encrypted: i=1; AJvYcCVfjq8ZHFCvjbSyo665bwrEmqxhQhpUOKejOrL7VRDDw3FwwjhIf+f8ZH/QCMDVvmhn3fAOqpfMaDci9KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycyV5pydDzryt9lFT/ywGOkvKkw1tSiPTH8Am4hLCfmBfhHdry
	bqvGQo6sOhPBxclNtTuwotUx0+i6DXwLRLkFgZCVfUP+L/3VAMrD
X-Gm-Gg: ASbGncvVu6dUwLkxX3pY/H8hh0xXMJljOmMb9KmMeQcWcd/ussLgxQ7opod8HJ++R/s
	TbbSXCRUsSNK1SNz4O7kAHuDnoMSdGeENB7MVT/VutHTqKawi4sAQQAz9pztQtSkqq3Ndd18s4/
	RLxzBOHEPovCXkCHai3BWIyF8JJGD11iD81eyfRPAWE3/f1ERoh+nCtJahA+0KzaDBi22F8QMD0
	jTcVxm/H+D57fbyDYBKkbDAhVXzALLauJioKxckD+hin3LRhVUFcD2xomxU244V1Fw1EC+bJLjh
	e41CIJdKEAxjfy590h1V76kxFpJaMg97UDhpm4XDvh9EEME=
X-Google-Smtp-Source: AGHT+IFrw7EmfxOH9MSpeh5HQd6u8DJWIr9NwkrsX23oxfMP+eHGV56Vg893NNzA3a8wcq4yDxW2tg==
X-Received: by 2002:a05:620a:46a3:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7c775a34e1cmr2586558285a.30.1744119144179;
        Tue, 08 Apr 2025 06:32:24 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96e611sm757715285a.62.2025.04.08.06.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:32:23 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v7 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Tue,  8 Apr 2025 13:31:41 +0000
Message-Id: <8e582c7166200e618ff56ec10ed16b4a4e73eece.1744117091.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744117091.git.abrahamadekunle50@gmail.com>
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains no spaces around binary operators with long lines
which reduces readability thereby not adhering to Linux kernel coding
style.

Add white spaces around the binary operators and use line breaks to
increase readability and ensure adherence to Linux kernel coding
styles.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..9ba3bebfc8bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,13 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(pattrib->seqnum + 1) & 0xfff;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

