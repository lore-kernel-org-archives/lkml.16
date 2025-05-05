Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869822505D6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455248; cv=none; b=sQKss8HlrKFSOu+68g9owmrBR93QWjAMtH9xlIpD60M0QyPq3Y/y9uwxd9F83Ot6J4nvJS5nlr94eroE4LhMmT7uoddi/AVPW+nmGz35fVDB7YP6evSJ9nV685YrpnRt2HnmE/pwq23g4PPPz7I0/fNVMN/A+CyPmhdXYB+mil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455248; c=relaxed/simple;
	bh=Ly0CvE3a7Ft2cguZwUX08mOhOyHbvdJxbcYNTMDul48=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JerEDi6aIUfPl181dIRy5+h3ajTrSCyPloa+KywGMDd04+MirTofWTOfHfCar8HWk9FLI+uDiX4xEj+ZqVkUI080zI6U0gVgSM6YAxdUyR22JemsyugvNvgNIwtYf3LJeSAY9LXntsJ8Y2vUbUseLfJa4nWnyVNxLZQvt2lDOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hw9zGMpK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hw9zGMpK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so37054325e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455245; x=1747060045; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAtVszf1vdrmHz2MZSZ/fpRznhrZHx8AbHdFOY7qIPA=;
        b=hw9zGMpKmVUHTAtRLOzfTBFRB2Mgum2BJuCXuGBnWHTC+aN6ruDP/oTg6iqSUJL0eW
         iErNIwjpqpqYBeIu5SvADdpPFSG6U58CIrLnqVF5h47cfBaWm4bJUtlrEbOMYpWLRBVV
         K17JdBBJ8ZFVs+yjm+4k0sy3jNAERytEnjVYNc6Vq+VZL1uT9F+PP0cDU91fnvFMPW4I
         FStqDEPzemnzZZE7SkYSkl40X+8d5aV/KrU2nAez87aAMRWzi+KUM3kWbanJf8OgbJm7
         GEacw5DSq+YN2I3iZDYASIzKhrHQl+90HN+1xXKbHned67p9NBJeZsofmcwkC9g57HqJ
         LLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455245; x=1747060045;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAtVszf1vdrmHz2MZSZ/fpRznhrZHx8AbHdFOY7qIPA=;
        b=XaftKcgj/WIbtNM0LTPVNgRUAB1vUqB2adLXLAChwfNckKfEkFs/adp4W+Ok8F1/sm
         FSGE+lgE2bq7IlyICY8ppA7BXpLs1/nOuiE3lIb/DSanB6YVy5OssHLpDWD6NqH23Tdg
         Cae9kTwlurLKlzqk5rbDSBO1s97n+sHJyrQeQTxYkjayiY/iHrcIQ//1cIex+0DpCCXc
         1ZePCrSqJRpoXNnM03Ifbe/jsZtgqGGrho/VL8g9GacdiwsDQwzmk/jIUHROVnq2wQ5M
         w19qgq7IVzpjNMJTiC+SFID40MJI3X3dBNzpt8VUJ5/8qlq+HjB7ipfctpnB4PlH7vSe
         M1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZFY5FpeTHAuegKc7mvJx7VR6IgMZPLSWlLsybQnwD85uDz1n2Zw4g+ZcggtOJdkHqB1NpaFcx8KckEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrAElAPVrXPddFuausTaJD5QjmN5SXWs2sxs/zANGkwht5unqz
	jDpSJcVv5lxKgmfGk7BtlV820brvEn2MVRcbcomv9nzTNGRd1gBYMfqfPoS7IL8=
X-Gm-Gg: ASbGncvhF0sKqr+ofxfN4Q6xTjBIyUbhay8fB50pRFSuHC/+Kywqg5DEAMxuNx7+zdb
	4VDAcq0dNRb5uMDVIiP9ZAcFhLAz/bQzHYD0/0QzHDSGV77P9CEvWNpgzilIxsia0zPzbSAv5S6
	sxnCccUvjUqLE2xX1mdwia8dvErpYnxhxWm2J8s6Lt3zyfOtsaXFe+kcnd8v2ZJFWEg9tdieQ19
	j3LqOjTp8E2W0CHGoi8IzlrfW8O58JG4YyBOa+WisJFzltqymlUtbxG7Rms7IQQdcqpuIJxHA6o
	b03Nc0Rs2wbuVgaXvEeYuDdVz37bKozQw7zTDcRjrAYAtg==
X-Google-Smtp-Source: AGHT+IHdZ4eHWjSeHJWyp03pTCeFtVQb1fWivNtID+bl+XU3/4RJV+jvA1o2S7f/8WrZbEMT8MT8Rw==
X-Received: by 2002:a05:600c:3494:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-441c48aa314mr72504945e9.4.1746455244822;
        Mon, 05 May 2025 07:27:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecb60sm180087725e9.11.2025.05.05.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:27:24 -0700 (PDT)
Date: Mon, 5 May 2025 17:27:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] cifs: Fix double unlock bug in open_cached_dir()
Message-ID: <aBjKyIM-OqMBjFNv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The "goto out;" also does mutex_unlock(&cfid->cfid_mutex) so delete
this duplicate unlock.

Fixes: 62adfb82c199 ("cifs: serialize initialization and cleanup of cfid")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
To be honest I suspect that we're going to have to revert
62adfb82c199 ("cifs: serialize initialization and cleanup of cfid")
instead of fixing it?  So this patch might not be worth applying.

 fs/smb/client/cached_dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/smb/client/cached_dir.c b/fs/smb/client/cached_dir.c
index 9e20e3dc2c03..3f4fe1ecdcaf 100644
--- a/fs/smb/client/cached_dir.c
+++ b/fs/smb/client/cached_dir.c
@@ -238,7 +238,6 @@ int open_cached_dir(unsigned int xid, struct cifs_tcon *tcon,
 	 */
 	npath = path_no_prefix(cifs_sb, path);
 	if (IS_ERR(npath)) {
-		mutex_unlock(&cfid->cfid_mutex);
 		rc = PTR_ERR(npath);
 		goto out;
 	}
-- 
2.47.2

