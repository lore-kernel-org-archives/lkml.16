Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA471C9DE5
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322717; cv=none; b=S97PcgRiekpMMZo614E2GuaCKJeQoUeq+9DZlQf3v/pxrag81OOenAktAwD8F+4re139+r5D13ssHpl9hqkWXvZoveYT0pQbxtJtbfoCVYHHU9N6AZjAteNDTroT+oHGYkG+szR6RAWUFE+r/wCrC3OlNFdGHY6wSgmVd2zWTpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322717; c=relaxed/simple;
	bh=G64rfImpbF1FYzyYP/gR8hcx9nPoEHeOmwT4HxZwJJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Z5QXwmQKl4xvSZo8dekUIVBGU3wSf2AL2/KiirldcZJzoeAinujdS4NnLEfncRrr1EsChAV34rNdxZbRysMMT1s8td/c93pPLc2Vpe76ebnAvETMkV6zRsW7lzfna2kHc5v+3L8eo9DoI5VT1gw+Z9tdtakQ85tF+Md9DadXhQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05750497;
	Fri, 31 Jan 2025 03:25:41 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52813F63F;
	Fri, 31 Jan 2025 03:25:14 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:09 +0000
Subject: [PATCH v2 09/18] firmware: arm_ffa: Helper to check if a partition
 can receive REQUEST2 messages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-9-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=G64rfImpbF1FYzyYP/gR8hcx9nPoEHeOmwT4HxZwJJs=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQBBTTtnffuet9l2+whZjxfNSeTSb6KoWvk
 SGzsRKCtBmJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mNdTEACWqF8ZwLi5yHJXwb/LhPoAIwDMgMqpsuz7af0FGXblGxFVhmRdTUjmSmrlfDQ3W93QAaT
 qveCYsxwY3uAkbIgnY058DM+rvVB9AJlGN0Dgvtzv/DaP4dUtqWaAsinTXf5iL2TdkbrwKR2byt
 05gsqi3AzLjII1yiJz7jGIrbxyXrth6vPZicD3jQOxTdhCPMXcQ9EoYzKFbfd4nZOZrUmzq18d5
 SDtcS2eiD4di8Kj2GS74U7vH0rlhYsgzWfS/yKM6szVYR4iuFIHc/w2I9+Kx2YTU5S3Uc8jgX2v
 H8ejmruD60cUqCcHPfhheFR+UqA09XaPu6cbqKa3bIP5DSug5v43C28uHJNJtVnzB09WL4XHw9D
 RCh+Rr7fNLrZaTEYjathiL7D6mY8PphFgV2qL2p0e9jVJoRZBIiRTauud3qVCGf18zsfaJCqtvd
 ttqaoUivbbsFFAmZ5CaZ6smW4aIKYqU3lDFzzu62Yk9LKUcZBgXTjpU1Q4/Xm2x81KeOYTvWeHf
 CGeKR8HWqdyWfnc6Bgh/hIwutjOtm8/rRzblmMfDLb4LAUlFU2r9MXJBBXHtLCYRKW7RfE4aN0l
 aPsdSIRqoptUu2RNHmkMAk81pQkoMk9kSdIf3P41edlECtKb0VEubvd3lL5I7YXYnpb1sid4MrA
 QC06iw8whIcVtwg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Add a helper that allows FF-A drivers to check if the partition can
receive the direct requests via the FFA_MSG_SEND_DIRECT_REQ2 ABI.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 include/linux/arm_ffa.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index ca2ad5b0ac4309052d55dcf546d29423bbd40a67..761ea8fe3bb6080c893a5eb365358b62d6a4f3ff 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -240,6 +240,10 @@ struct ffa_partition_info {
 #define FFA_PARTITION_NOTIFICATION_RECV	BIT(3)
 /* partition runs in the AArch64 execution state. */
 #define FFA_PARTITION_AARCH64_EXEC	BIT(8)
+/* partition supports receipt of direct request2 */
+#define FFA_PARTITION_DIRECT_REQ2_RECV	BIT(9)
+/* partition can send direct request2. */
+#define FFA_PARTITION_DIRECT_REQ2_SEND	BIT(10)
 	u32 properties;
 	uuid_t uuid;
 };
@@ -259,6 +263,10 @@ bool ffa_partition_check_property(struct ffa_device *dev, u32 property)
 #define ffa_partition_supports_direct_recv(dev)	\
 	ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_RECV)
 
+#define ffa_partition_supports_direct_req2_recv(dev)	\
+	(ffa_partition_check_property(dev, FFA_PARTITION_DIRECT_REQ2_RECV) && \
+	 !dev->mode_32bit)
+
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP} which pass data via registers */
 struct ffa_send_direct_data {
 	unsigned long data0; /* w3/x3 */

-- 
2.34.1

