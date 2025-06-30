Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109828DEFF
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301197; cv=none; b=CflFKQqEMesgDgRatjm6OXikXaVC9li74PEdj1nrsFgxg/lumkydMAd6/az3T9rUu9FtnEhPuAu2zK1N1L0dfCrkbTuzh+IwGt6XP0+7gdXk+hJiHSlrXRHLLmHzR5RSfNIBVtLowVSxsPcFItMR8lUynxPb/tt+gVH+tgpTk/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301197; c=relaxed/simple;
	bh=TlBBWhjw66vU0WVncgBo0ciJaAdFdenxkE0NF7pgGLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fkX1I8tJkM0DSH7iKSp4YrCHPRLbRFKitRthlPhkBpKSREbyJ+CacVM0vYPpVeTDxz9kL98a/2W3Ew1shdL+betwYyW+/iVZoM4DO786a6PA7qbSxHY7I/0t+WDNTQ7RAWK8dAsJ5pwxkYH4aMDbHYr3zhpw1hvakZVQ57n1GuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ApYPHPZz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ApYPHPZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751301193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PCXz84xtjif+9AQOmzcJZnqlDzRDa6bAl/lnTU35pOE=;
	b=ApYPHPZze4CWGUk2cNGvw32uP8Rk7MhR8tH9Y8Bkd5cCP3ml1/GRgReKWd72jUqqi/Li55
	rnKbMobahY/3hs5PMyITgkoDGAGnfOaueYnouGau9BDAhbBIuYUExmJHO3KacmGTVVG4sF
	E+8l+cy9fRRSlP/+pJlcxjSrTKhbmto=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-mXiVP2FkOFWt4iohlD-PpA-1; Mon, 30 Jun 2025 12:33:11 -0400
X-MC-Unique: mXiVP2FkOFWt4iohlD-PpA-1
X-Mimecast-MFC-AGG-ID: mXiVP2FkOFWt4iohlD-PpA_1751301191
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450de98b28eso26312735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301190; x=1751905990;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCXz84xtjif+9AQOmzcJZnqlDzRDa6bAl/lnTU35pOE=;
        b=ZFpc7nqFRF17gHbt27b5OhVkeNL7Raaza4ER+rRgah+JwnbRzTBhfXuuiRtaUeYPrP
         lQc8yNrzZgTEv7JH5o1TKuDSvWF3Eqdeg/3OFVqoCePbXuH4H+aAkhDmNRMDv0jZ8ICO
         fmf0kc/ymz5fBh/ErFL9kt39FVCjCn2vdxENoXfLK7Cn9TZOAtJuQ32ASOEU9/tRAk/N
         6ILFnjABcstpDn/VO9MlRG2CrLCtiikikBNbZ2MTlIuq7fLaR5FdL0laTtdMxW2SrVBl
         yhVTfRHypOfs5Ob7Ol0o8UAjNPxnwMXE7ws1OIMOiQI/xwiri4OIUR0KAVdCtTsgm1jM
         1cuw==
X-Forwarded-Encrypted: i=1; AJvYcCXblsvUu1bMla3ivKPejnC2ArI69a/o50+Xe5DaAe9C5FzAtSDRnkTMDuaHD6F0fyO7WeaYegVGfqOhn3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvqTwFddxoUCfPEZXyPZiQT1zxpCZhvFT1DYxw06H2KUgqmEdA
	fDEyXdtQ4vAxD/nYaKydkyajFyb2BYv2UXuyTSwp9ppoDAwIHsKcXQyV8uEMp/CwqI5s1hdHTgd
	FlKXQmGuvkibirlrBQritaCnpn0hb6uzRuEFKQNlgfNYwfKQHctgm2L8wrKLT25SWxA==
X-Gm-Gg: ASbGnctqmSCOIQSm80Sj1Q3y0PGGJTACumrVLP4xE94/9kD9JCzAoWwtj/Xwfve3KGK
	45HPiFxYYxcWGzBSxgwXWlpWJ/uOjxlxurLtLSrplelyisNA8yFa6svfqRZjSUygEP5fdA9FotV
	uAVk6LCxRPmNiSQvJu8FHlbJ/p7Fjrw1XmV2134dm3QwSwgF4HQ18nGW2CZF7idcd/ZygIjYMqD
	8RaJzVaelh06PjypDFJ48sjlRcnnp7W1+EMJjxz9tLVjSk4jTvtY1rAjAdik/bKB4Qzxhd4+Wsg
	AwH9qZUbUWMpxxBVsNoTLWs0AmDJqALW5wupYQW7Hj0kxVfPaVaNWg==
X-Received: by 2002:a05:600c:548a:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-453a7912cabmr2232195e9.6.1751301190528;
        Mon, 30 Jun 2025 09:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSfXHhHLnv7HHQ+5LMg0eJpi2fcwuM4hIgZV34bWufMI5k6opX1s+0mXAanNIxjpTh6gD5WQ==
X-Received: by 2002:a05:600c:548a:b0:442:f904:1305 with SMTP id 5b1f17b1804b1-453a7912cabmr2231815e9.6.1751301190105;
        Mon, 30 Jun 2025 09:33:10 -0700 (PDT)
Received: from lleonard-thinkpadp16vgen1.rmtit.csb ([176.206.17.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm142554375e9.30.2025.06.30.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:33:09 -0700 (PDT)
From: Luigi Leonardi <leonardi@redhat.com>
Subject: [PATCH net-next v5 0/2] vsock/test: check for null-ptr-deref when
 transport changes
Date: Mon, 30 Jun 2025 18:33:02 +0200
Message-Id: <20250630-test_vsock-v5-0-2492e141e80b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD68YmgC/23NwWrEIBQF0F8ZXNeiT42mq/5HGcrr86WR0qSoy
 AxD/r2STSdMl5fLufcmCufERbycbiJzSyWtSw/u6SRoxuWTZYo9C1DglFGDrFzqeysrfUnD3uN
 IHsE60cFP5ild9rE3sXCVC1+qOPdmTqWu+bq/NL33/w02LZVUBtSHQ6JphNfMccb6TOv3vtPgz
 mp7sCC1NKRQx+ADDvHBmj87aH2wpttgtUWINk7D46+9s3D8td2q4GmkwODwaLdt+wVA6J2CYwE
 AAA==
X-Change-ID: 20250306-test_vsock-3e77a9c7a245
To: Stefano Garzarella <sgarzare@redhat.com>, Michal Luczaj <mhal@rbox.co>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luigi Leonardi <leonardi@redhat.com>, 
 Hyunwoo Kim <v4bel@theori.io>
X-Mailer: b4 0.14.2

This series introduces a new test that checks for a null pointer 
dereference that may happen when there is a transport change[1]. This 
bug was fixed in [2].

Note that this test *cannot* fail, it hangs if it triggers a kernel
oops. The intended use-case is to run it and then check if there is any 
oops in the dmesg.

This test is based on Hyunwoo Kim's[3] and Michal's python 
reproducers[4].

[1]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/
[2]https://lore.kernel.org/netdev/20250110083511.30419-1-sgarzare@redhat.com/
[3]https://lore.kernel.org/netdev/Z2LvdTTQR7dBmPb5@v4bel-B760M-AORUS-ELITE-AX/#t
[4]https://lore.kernel.org/netdev/2b3062e3-bdaa-4c94-a3c0-2930595b9670@rbox.co/

Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
---
Changes in v5:
- Addressed Stefano's comments:
    - Use a macro for G2H transport detection
    - Improved commits and comments text
    - Rebased on latest net-next
- Link to v4: 
https://lore.kernel.org/r/20250624-test_vsock-v4-1-087c9c8e25a2@redhat.com

Changes in v4:
- Addressed Stefano's comments:
    - Minor style changes
    - Use `get_transports()` to print a warning when a G2H transport is 
    loaded
    - Removed check on second connect: Because the first connect is 
    interrupted, the socket is in an unspecified state (see man connect) 
    . This can cause strange and unexpected behaviors (connect returning 
    success on a non-existing CID).

- Link to v3: 
https://lore.kernel.org/r/20250611-test_vsock-v3-1-8414a2d4df62@redhat.com

Sorry, this took waaay longer than expected.

Changes in v3:
Addressed Stefano's and Michal's comments:
    - Added the splat text to the commit commessage.
    - Introduced commit hash that fixes the bug.
    - Not using perror anymore on pthread_* functions.
    - Listener is just created once.

- Link to v2:
https://lore.kernel.org/r/20250314-test_vsock-v2-1-3c0a1d878a6d@redhat.com

Changes in v2:
- Addressed Stefano's comments:
    - Timeout is now using current_nsec()
    - Check for return values
    - Style issues
- Added Hyunwoo Kim to Suggested-by
- Link to v1: 
https://lore.kernel.org/r/20250306-test_vsock-v1-0-0320b5accf92@redhat.com

---
Luigi Leonardi (2):
      vsock/test: Add macros to identify transports
      vsock/test: Add test for null ptr deref when transport changes

 tools/testing/vsock/Makefile     |   1 +
 tools/testing/vsock/util.h       |   4 +
 tools/testing/vsock/vsock_test.c | 170 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)
---
base-commit: 647496422ba9d2784fb8e15b3fda7fe801b1f2ff
change-id: 20250306-test_vsock-3e77a9c7a245

Best regards,
-- 
Luigi Leonardi <leonardi@redhat.com>

