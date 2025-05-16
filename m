Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF123E35B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399194; cv=none; b=hD+W0++3QWWvPWStFej6XlQ9Ktndbs0gO/S2Y+NgjxySYrzucjJxdm36PIpqjYWTbFdl1xatKekRrEE+OUT33TXAIe91Bk+pUjm6WD5Pss6/YY0Tj2D7u9yLc/sM0x027Sxkzzu6vgtTz7gfgmUNPbZDNy1BTc0BfsIMQzKkIp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399194; c=relaxed/simple;
	bh=bmgaT7YD2EJBkYL7K7imFqPWf1lV68fhOx0CtwG7grA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ekA4Ul3nu3KUrbmEe8Jx78ZLHfds4QDklzxuBndTzt1XpFU/MUskrCsmrRJbY4GRItyNNOgkej9twZ+rlWCMcb9aj79Qaoe0mJAMUNcrX9zJL802SMxpyX84OL++6rjlQMTOEd0h3Lx1TvNCM2nf17LrjtAexoqcupv8XF3dIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nhwc9ZZ4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nhwc9ZZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747399191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uhz3U140ohpt6ccWc+FSce3umZsRmkKP4Ya4jbqjSpE=;
	b=Nhwc9ZZ4XSIx89kP9N4+Iju1pM0htTxbPmFX9J/5MORuZdyyilEQxioThsBpHaaKZGSyZv
	LblO3W+XYJkSTW7GZK3GBvvf/+2YUOP362VXfWEhkcezHIEvpql4Hd3mXN2eKNQDFCSqYm
	GDkNyDbrGdDQCcUBbiulxa6j+3HVOes=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-omvmin-8PtqpBvRdcLyxrg-1; Fri, 16 May 2025 08:39:50 -0400
X-MC-Unique: omvmin-8PtqpBvRdcLyxrg-1
X-Mimecast-MFC-AGG-ID: omvmin-8PtqpBvRdcLyxrg_1747399189
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso10933305e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399189; x=1748003989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhz3U140ohpt6ccWc+FSce3umZsRmkKP4Ya4jbqjSpE=;
        b=YKA0ohW1ewjpIfYyRBTZkuzQjmBt5COAJqNa4YSmC8GANPGpVhkmC+7BKoC3+I16eI
         6fYvuXbTiFzAtWN8h/tF6HniOEM2W93JcAWysigAvy4lwRSWpFIBQc9OFmMrxf237QxY
         HiI0g9HkzMR4HX3Cc6g6ohaPBiEBrnf7w9XM1BMgxpbJL0CKkcnIji2Lfcfi3VY3XVA7
         dQ0TLWdoaxDbJzqqF9KHZcDTV8zNbpkeDuL+8kcZfPyUFGPbiYtgTW7zI4YkgiKge5Xv
         sNB60xHvf16KGHFJ0jEAXHK1+kyXTkhPDCHP3klzItPBBNsouk7T+lmvbugzhBbiu0QU
         643A==
X-Gm-Message-State: AOJu0Yxag8TzTkwBnlrA/d6NBEUG0LvMIl24QdthgqcL3J+ZVjrveuLn
	lM90EqsyWmhI3lI9H5QMLtYtTR4Wr2G+ojVia/NEuASfyabhfpd7vaPj9RIxqeoEbYfI3DbUrTn
	3c79dG3YtCbrHpLxWq2BbT12mX3FsvSPbiD/DnkKK1oFO02eNxpYfEmV2EN/ZP9W0TfAuT8Sicx
	3axJRXX4cX84JCLlqpMs/WGltIUHu2QSSF0ruaMIibdghoDW6/
X-Gm-Gg: ASbGncsPoxCRCQXo18FJDxX1RW8CMSPCbVv1BUOYKNdP8a+LTE1gBtFsOYY8u6L+H9U
	/E2wOmLNUcS1BxCfiHwHdZnlHsKk656dy0jxNnflPjloXIrN2YEaJD84dMnSawMgdORHVW0SSR6
	JQ7xmsDNZb0SR9KUjGL+PnB11jQOD25FhSKjO/tLFTM5I5NGj63nbabjhpvwJsHFyWNjy/OG78u
	6zZxwmti6zuz3ld4Im7UPim9shUsvzP7cMGoS7tzJ0LyWKyDF5O5YKBshw4C7TC3R7n8nrsZzTp
	U7TRWyOMmHbxBlgxE8TJ9RtZnszDAiD4CXKEv/FsxjeL2Ip1xTs8hxE48hpblF54o4IJaUEM
X-Received: by 2002:a05:600c:154c:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442fd93d4fcmr26794625e9.5.1747399188739;
        Fri, 16 May 2025 05:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG02eCs69TcqCLt8j2+2wKH4FlJPCCyiADW1BjCbtX8Ej+iIBeRfP51iBLLuyg6K1U4dIYtGg==
X-Received: by 2002:a05:600c:154c:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-442fd93d4fcmr26794325e9.5.1747399188282;
        Fri, 16 May 2025 05:39:48 -0700 (PDT)
Received: from localhost (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442fd50b30csm31929825e9.9.2025.05.16.05.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:39:47 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Sebastian Mitterle <smitterl@redhat.com>
Subject: [PATCH v1 0/3] s390/uv: handle folios that cannot be split while dirty
Date: Fri, 16 May 2025 14:39:43 +0200
Message-ID: <20250516123946.1648026-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From patch #3:

"
Currently, starting a PV VM on an iomap-based filesystem with large
folio support, such as XFS, will not work. We'll be stuck in
unpack_one()->gmap_make_secure(), because we can't seem to make progress
splitting the large folio.

The problem is that we require a writable PTE but a writable PTE under such
filesystems will imply a dirty folio.

So whenever we have a writable PTE, we'll have a dirty folio, and dirty
iomap folios cannot currently get split, because
split_folio()->split_huge_page_to_list_to_order()->filemap_release_folio()
will fail in iomap_release_folio().

So we will not make any progress splitting such large folios.
"

Let's fix one related problem during unpack first, to then handle such
folios by triggering writeback before immediately trying to split them
again.

This makes it work on XFS with large folios again.

Long-term, we should cleanly supporting splitting such folios even
without writeback, but that's a bit harder to implement and not a quick
fix.

Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Sebastian Mitterle <smitterl@redhat.com>

David Hildenbrand (3):
  s390/uv: don't return 0 from make_hva_secure() if the operation was
    not successful
  s390/uv: always return 0 from s390_wiggle_split_folio() if successful
  s390/uv: improve splitting of large folios that cannot be split while
    dirty

 arch/s390/kernel/uv.c | 85 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 72 insertions(+), 13 deletions(-)


base-commit: 088d13246a4672bc03aec664675138e3f5bff68c
-- 
2.49.0

