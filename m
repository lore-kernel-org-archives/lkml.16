Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5DC2F22
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 03:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749958330; cv=none; b=S0aZZEevM8FbVxqmxbPXBUG2CGRSJjoSUUWQ4MVCZtbPaF6qHPI7W4j2OOMyAcS/FB7JAmWimskgb0LgEgIJoIi/IBwg6PL1AJDpv0l9l17QQ73AO5/UyxHnxogsbkYwlig31Nb4lpjpsptVSyPp+TwSn9Qccas+wruCyqvp+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749958330; c=relaxed/simple;
	bh=yJdEo2RwwU5YxOyGj4vX9lpiXjzlz7Kp0hPfWc+U1GI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Q4zQjOJm+UQDvg/NcauyrQQazlBwrXzu/jJq5EF8gZu6PGeozwMSbGhodb8hx85Oz2ddPSDdPWxKGgxw+TBeRNYDzKRVjci/O7hEVAcnvLohT32sfimSdcGJdBg5S72HcxfpuAZzOQb6WGQCBQUXJURX7wSPeUj9ofQ3fZjlnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Ssq1peip; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Ssq1peip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1749958015; bh=fGNptaSBMebz9/PxbjyWCc+j4SRqV+ip4ZzV+bpFo58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ssq1peipTg1MdwkbJoTQW2WqxUp3oFN5fY+cWAuoOAPlVmXIJHm6eWVf8HyblVvHd
	 WEbxMRbOr9Bo2wERhrmjuVPizDpDsEPWP11edWJhP7avjjvOUB0bTnUBVEITgxZN8Q
	 yF2n+6icBSCDZcTIdmNN7ap7f/i5ZiQD/45CzkBg=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 6B6026DC; Sun, 15 Jun 2025 11:26:54 +0800
X-QQ-mid: xmsmtpt1749958014t2wgbx76p
Message-ID: <tencent_E8D075F57739678A3C9D3726965E37FA4A09@qq.com>
X-QQ-XMAILINFO: NG7xP+P+sy64HU4KwG9RFvxjQ1c0kfiV2TFFph/KLRJOHx/CM75VaooDoomjf9
	 9v0yRkTr0624H5jm4SyQnYEhze4vqNH2AYfoL2BQQqONAVBkZICrks1CV8Uae7j2uav2iEBimNpd
	 8xmPbJCJTLbSCeNZwTf2HPacT7FeAjJ57sKL1g1JKAMmW+ca7G7hbC9B4bKqubH6NZkdqTOn92ej
	 jq0jpLbC3ZGa75Jy1U7taQLntNdVbQyKwBGHUc3mHn8Cg7MYlYqXmsa/ejjrIhB4vxuuh5ZY6CyM
	 JJwe9vvGXYr+Q5zcT3OjH5LmZe0BQat8U4WlkH6ekwYoTUD4UcMb+nE7297ofgPY+C6yWCBZdgjU
	 F0hV6V3+UmAWYeyMU/I16PDgxWF4GPptkzcAac6w2TB9B4pDlxv1Je71flLDjKvJvhFZQ9TO5QGQ
	 ZzrXiJZy0yFDFW5Zp8i3MjDTvz5odw6iodQnL2Mvry/UjLGImLSsWfaA7doyiXSijf5RzHvye8XS
	 /RwQpbOnRbNKk14qoXClqTlrlmrbwyaeWMxp/AwnLozLMslMrjOxxa9dpNQ4WSRkmrKDxt91RLd4
	 TaOWt1wjvADjZ3H5cRv/SFEjRsa2xJRiUs77/idHFwNoQD8+U7uTj46u3OEMSjIxz1GpWz3lYJ2f
	 Yn4Wu6YqsSSunGe1AYSceudh56dtpTo6dEbSVTIWWsqpm/t0nFvhjA4ggOay4EPRaosugcrYessf
	 tI2YO2SlhWCIHBKe3nUAhCi9yo3SYF70YuWwBi6H9s41wccW5EQLAQ1AQsGBExC5XIF4V3N9nGDi
	 9kb98xc7P/GgRsN90Kmk8xp1RlP3MQrm412glq+X9F1ia/9lANQraPfS0KEGMpl9E2ouyDWDiwEI
	 nuL62c1KSogsxMa8xBUD7dqVZodTfAD3As30zXcALEBXaAJ9wkmLHYx/jq1YGccrbC0hCdruAeqp
	 PWxW+Vb5Y=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+d8f000c609f05f52d9b5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [iomap?] [erofs?] WARNING in iomap_iter (5)
Date: Sun, 15 Jun 2025 11:26:49 +0800
X-OQ-MSGID: <20250615032648.3634452-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <684cb499.a00a0220.c6bd7.0010.GAE@google.com>
References: <684cb499.a00a0220.c6bd7.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 14ea47f954f5..c96907850c56 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -686,6 +686,16 @@ static int z_erofs_fill_inode_lazy(struct inode *inode)
 		vi->z_tailextent_headlcn = 0;
 		goto done;
 	}
+
+	if (!erofs_sb_has_big_pcluster(EROFS_SB(sb)) &&
+	    vi->z_advise & (Z_EROFS_ADVISE_BIG_PCLUSTER_1 |
+			    Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {
+		erofs_err(sb, "per-inode big pcluster without sb feature for nid %llu",
+			  vi->nid);
+		err = -EFSCORRUPTED;
+		goto out_put_metabuf;
+	}
+
 	vi->z_advise = le16_to_cpu(h->h_advise);
 	vi->z_lclusterbits = sb->s_blocksize_bits + (h->h_clusterbits & 15);
 	if (vi->datalayout == EROFS_INODE_COMPRESSED_FULL &&
@@ -711,14 +721,6 @@ static int z_erofs_fill_inode_lazy(struct inode *inode)
 		goto out_put_metabuf;
 	}
 
-	if (!erofs_sb_has_big_pcluster(EROFS_SB(sb)) &&
-	    vi->z_advise & (Z_EROFS_ADVISE_BIG_PCLUSTER_1 |
-			    Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {
-		erofs_err(sb, "per-inode big pcluster without sb feature for nid %llu",
-			  vi->nid);
-		err = -EFSCORRUPTED;
-		goto out_put_metabuf;
-	}
 	if (vi->datalayout == EROFS_INODE_COMPRESSED_COMPACT &&
 	    !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_1) ^
 	    !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_2)) {

