Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369E1EE019
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352002; cv=none; b=I3u+tv1yaM0cvlhNRplsURLMnlwEroxGN+S96AtH+pQlk0919Zd1qyoUIFltzQ4Zm+CeWyQFY36b8aq0Jb1C4dnbZX5bSkXIofPwsIkmAW1LUyBc6j1wzHwrSxQo1i366nzTC3zS18Gnf/8gaqL+Q8DNu2pwKTWSVwMr99MeDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352002; c=relaxed/simple;
	bh=tQVpcu5z++MJNVzF/A5a39223UgFzZdoUkekpkLSzQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KRqZTdX7zl7+CAr80J499oGk5yjgS5rSpExDuirP+7AR/ZIpHZCwBnFUdrlMlxgjco97fEiOFiEWPksej0HAbHP/5nFbimn7IU8XclWxhFewx3jGCbvtqfstk1a0RjPxRRxcf+A5bFAl00xXVcAO0TB7vNjKT5jKHVL8pbpqt18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloud.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=cloud.com header.i=@cloud.com header.b=cxWiXaii; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cloud.com header.i=@cloud.com header.b="cxWiXaii"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736a72220edso1674578b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1744352000; x=1744956800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf4zHGx4lcDXTEfGOrCW6kQd6POUmKVDJr793HuS9as=;
        b=cxWiXaii+BOHJec68g/RZbqWv8g/m7ndGEy+VjFJ7ZTj6xtXaJxRT5q5kyfGyL6YpK
         vw/LH6MmqM1LsMJP1oQ64G9NfwK+DGktJLqGYo5SLi+/npTlgYDa1GXwXbiPGkOIfPHn
         U23/AwYsCD0NYeTD/xhawz3Rkc0A65xZc+7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744352000; x=1744956800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bf4zHGx4lcDXTEfGOrCW6kQd6POUmKVDJr793HuS9as=;
        b=sFJL0ip1N7Dp6rGQqCYyARX0APcQjmSHUhArlJ3HFabOWNbRN7gFhNjLqGo5ZcU60w
         WYwVJPB4suHJlYSwZT5FVwK7WcWYKYH2AfZcwQwMDi3g2n0PFe36L5BJ42LHFU5Z2UnO
         alfc56puqrDdcEvLa6CPXvCqhgyVVbH7dktthdx6uKL6GpmqZhoOw6zMtTUQyg8hxu0c
         enCP9h44f2sSNaDRU7JBhoZ5WvpOTriCMmNgell9npnBH/OvAC4e2G929nZtb6tRn2kI
         t1tKp3yhyAAIRWPXi3pjsaWJ94sKsTZTXs+wEsDJkXrd17PkK8jv+AmihLmtdBTg2Wp/
         Cjow==
X-Forwarded-Encrypted: i=1; AJvYcCWzWU0dGTyW1nxS2mSuaeCPWUS8Dr6WqiegwQOPjSawZiBii1QcU71N1Q/HjCdiKmqjT+i0yM1MFnrDLJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx21pGsJPHx+JmVVXgdS7FuoXARLgczydoN+/p3JI8znysmMcr
	n/SFGjp4mcovo1NPzurcuFTdVLizk1cTAKEp6n0rxTxM/fp++fxr3Cs+FHYIrkI=
X-Gm-Gg: ASbGncuVaXl4OgaWWJfXszNNxzsRQ2fATc4b1blisIwzQ9JaKpjYrKnWHOZqAshqoil
	UiIx/E9BkKdr+j31+C+06St5JkRG1qL/KJfTDP++YHi9WOOom/PWXe+6Wv7krVTgskFc9EoRzC0
	IcaFNFQBNKIY2jYxOGRG0xBg4vDwvL/HPQDhncC+hbjluD9flJBXHv6QuxCPqCoRSbqRWhq9VjR
	K9CW4aszQAB/DX6XyLfZNolG+dt4D+z76rP9KdcIizFpIkoeNX1xc359J2BFlA8mlERYLAbmiyQ
	LRL7E1kHAdRsm/8n7NF6gAfW4XrVOLMwAt4tEjuzOA1I5WOCNwTMfZ+hs1pXJ7A=
X-Google-Smtp-Source: AGHT+IEWgly1RcndZlUlRXqWh0lvSiJiZI5498qan/5NqsTi3RwqZ5BqH1XV04V/PFy6XDGuOOQp1A==
X-Received: by 2002:a05:6a00:4603:b0:736:fff2:99b with SMTP id d2e1a72fcca58-73bd129e576mr2153137b3a.23.1744352000360;
        Thu, 10 Apr 2025 23:13:20 -0700 (PDT)
Received: from localhost.localdomain ([154.91.3.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198a73sm661774b3a.22.2025.04.10.23.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:13:18 -0700 (PDT)
From: Chunjie Zhu <chunjie.zhu@cloud.com>
To: smfrench@gmail.com,
	Steve French <sfrench@samba.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>
Cc: chunjie.zhu@cloud.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ross.lagerwall@cloud.com,
	samba-technical@lists.samba.org
Subject: [PATCH v2] fix open hardlink on deferred close file error
Date: Fri, 11 Apr 2025 06:12:00 +0000
Message-Id: <20250411061201.122232-1-chunjie.zhu@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAH2r5mv27yTcE3wjSOj1vQ8S1Lgbw3LdAevNtB5UiAF24yWoaw@mail.gmail.com>
References: <CAH2r5mv27yTcE3wjSOj1vQ8S1Lgbw3LdAevNtB5UiAF24yWoaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following Python script results in unexpected behaviour when run on
a CIFS filesystem against a Windows Server:

    # Create file
    fd = os.open('test', os.O_WRONLY|os.O_CREAT)
    os.write(fd, b'foo')
    os.close(fd)

    # Open and close the file to leave a pending deferred close
    fd = os.open('test', os.O_RDONLY|os.O_DIRECT)
    os.close(fd)

    # Try to open the file via a hard link
    os.link('test', 'new')
    newfd = os.open('new', os.O_RDONLY|os.O_DIRECT)

The final open returns EINVAL due to the server returning
STATUS_INVALID_PARAMETER. The root cause of this is that the client
caches lease keys per inode, but the spec requires them to be related to
the filename which causes problems when hard links are involved:

From MS-SMB2 section 3.3.5.9.11:

"The server MUST attempt to locate a Lease by performing a lookup in the
LeaseTable.LeaseList using the LeaseKey in the
SMB2_CREATE_REQUEST_LEASE_V2 as the lookup key. If a lease is found,
Lease.FileDeleteOnClose is FALSE, and Lease.Filename does not match the
file name for the incoming request, the request MUST be failed with
STATUS_INVALID_PARAMETER"

On client side, we first check the context of file open, if it hits above
conditions, we first close all opening files which are belong to the same
inode, then we do open the hard link file.

Signed-off-by: Chunjie Zhu <chunjie.zhu@cloud.com>
---

v2: if error, first close inode opening files and then open hard link

 fs/smb/client/cifsproto.h |  2 ++
 fs/smb/client/file.c      | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 260a6299bddb..b563c227792e 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -157,6 +157,8 @@ extern int cifs_get_writable_path(struct cifs_tcon *tcon, const char *name,
 extern struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *, bool);
 extern int cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
 				  struct cifsFileInfo **ret_file);
+extern int cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
+				  struct file *file);
 extern unsigned int smbCalcSize(void *buf);
 extern int decode_negTokenInit(unsigned char *security_blob, int length,
 			struct TCP_Server_Info *server);
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 4cbb5487bd8d..8e9582ff70f3 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -751,6 +751,12 @@ int cifs_open(struct inode *inode, struct file *file)
 		} else {
 			_cifsFileInfo_put(cfile, true, false);
 		}
+	} else {
+		/* hard link on the defeered close file */
+		rc = cifs_get_hardlink_path(tcon, inode, file);
+		if (rc) {
+			cifs_close_deferred_file(CIFS_I(inode));
+		}
 	}
 
 	if (server->oplocks)
@@ -2413,6 +2419,29 @@ cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
 	return -ENOENT;
 }
 
+int
+cifs_get_hardlink_path(struct cifs_tcon *tcon, struct inode *inode,
+				struct file *file)
+{
+	struct cifsFileInfo *open_file = NULL;
+	struct cifsInodeInfo *cinode = CIFS_I(inode);
+	int rc = 0;
+
+	spin_lock(&tcon->open_file_lock);
+	spin_lock(&cinode->open_file_lock);
+
+	list_for_each_entry(open_file, &cinode->openFileList, flist) {
+		if (file->f_flags == open_file->f_flags) {
+			rc = -EINVAL;
+			break;
+		}
+	}
+
+	spin_unlock(&cinode->open_file_lock);
+	spin_unlock(&tcon->open_file_lock);
+	return rc;
+}
+
 void
 cifs_writedata_release(struct kref *refcount)
 {
-- 
2.34.1

