Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20322CBF3;
	Wed,  5 Feb 2025 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745164; cv=none; b=jyvKuK221ZN4UkqDEzBhNaMAIizK59l2pO6KIRRED8GIjaA8TCUgL+BL6HxiQltAgUYPawYa54LnIue6NnNnOAlgnfTG3zvLeW8NqnPvXvcO+nfhznzh+MIsCWCCm9/xOQ6adh6Hc2lYd2APV90rX+ndr5wD/VktHdmE9mLs1Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745164; c=relaxed/simple;
	bh=3iEhokSWLQRqNjJrOB8QjknbOyjevYq14zfc0sIcRco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZlYsAtUsMqDF+ONMFdriI1ViNmzIXbtcL8bZWQaYc/lLuEanJt+lOSVr3OAPaejffWT32N95nvk4nyUEbvqIAJWt+tLaslkO0Ss2MGh+2Ki1lfzLE5Bi+vd2DmRFXTg8SG/G7Xahln8YGP/Kh9GenG7cUHRnvBkEAQQqI+pPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rd1pQoFM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rd1pQoFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745162; x=1770281162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3iEhokSWLQRqNjJrOB8QjknbOyjevYq14zfc0sIcRco=;
  b=Rd1pQoFMN/0QtjzkWgMd4vnGN9hMm9g0eRPWE2vizav7oz+ubG0FnUuW
   +TVRLpo1LygSgwhmGTjbloJSdGdMHlsYGU6caXl/exaeXnIlH964ECRSO
   swSkobjUK1YPMSXD4JXCz+lSEnrQYmfFuxlR7oQJfe5rxA8ibyfiGLH9T
   ga6gh/95egvnyW3mL/CjEHezb9Q0oEukZMo8ZN91WZMFFiqBoo2Tc/nUb
   R917mpfHuiT6nWhYUwc4FVfFxFCfB+Lgs7WPBRijlYj/Gp1LVoIWHeylA
   6GGb02K65oWiXcGdjYOq9BDmIgh5GecUne6wFS3p8RULyPZNFA3tGc2fn
   g==;
X-CSE-ConnectionGUID: 9nZGtWR7QOqgbQ6UUn5pIw==
X-CSE-MsgGUID: nNulMBI/S/uPcW1GXvGHLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532561"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:46:02 -0800
X-CSE-ConnectionGUID: lLmebCbmQoei+msLVkLQhg==
X-CSE-MsgGUID: CenNHgcERniEz0M4tkzcKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887941"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:46:01 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 15/16] soundwire: debugfs: add interface for BPT/BRA transfers
Date: Wed,  5 Feb 2025 16:45:29 +0800
Message-ID: <20250205084531.158763-16-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Add code to show what codec drivers will need to do to enable BPT/BRA
transfers. The only difference is to set the 'command_type' file to
'1'. A zero-value will rely on regular read/write commands in Column0.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/debugfs.c | 84 ++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index c30f571934ee..b3db8cd5afdf 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -135,9 +135,10 @@ static int sdw_slave_reg_show(struct seq_file *s_file, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(sdw_slave_reg);
 
-#define MAX_CMD_BYTES 256
+#define MAX_CMD_BYTES (1024 * 1024)
 
 static int cmd;
+static int cmd_type;
 static u32 start_addr;
 static size_t num_bytes;
 static u8 read_buffer[MAX_CMD_BYTES];
@@ -161,6 +162,25 @@ static int set_command(void *data, u64 value)
 DEFINE_DEBUGFS_ATTRIBUTE(set_command_fops, NULL,
 			 set_command, "%llu\n");
 
+static int set_command_type(void *data, u64 value)
+{
+	struct sdw_slave *slave = data;
+
+	if (value > 1)
+		return -EINVAL;
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	dev_dbg(&slave->dev, "command type: %s\n", value ? "BRA" : "Column0");
+
+	cmd_type = (int)value;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(set_command_type_fops, NULL,
+			 set_command_type, "%llu\n");
+
 static int set_start_address(void *data, u64 value)
 {
 	struct sdw_slave *slave = data;
@@ -196,9 +216,28 @@ static int set_num_bytes(void *data, u64 value)
 DEFINE_DEBUGFS_ATTRIBUTE(set_num_bytes_fops, NULL,
 			 set_num_bytes, "%llu\n");
 
+static int do_bpt_sequence(struct sdw_slave *slave, bool write, u8 *buffer)
+{
+	struct sdw_bpt_msg msg = {0};
+
+	msg.addr = start_addr;
+	msg.len = num_bytes;
+	msg.dev_num = slave->dev_num;
+	if (write)
+		msg.flags = SDW_MSG_FLAG_WRITE;
+	else
+		msg.flags = SDW_MSG_FLAG_READ;
+	msg.buf = buffer;
+
+	return sdw_bpt_send_sync(slave->bus, slave, &msg);
+}
+
 static int cmd_go(void *data, u64 value)
 {
+	const struct firmware *fw = NULL;
 	struct sdw_slave *slave = data;
+	ktime_t start_t;
+	ktime_t finish_t;
 	int ret;
 
 	if (value != 1)
@@ -215,40 +254,52 @@ static int cmd_go(void *data, u64 value)
 		return ret;
 	}
 
-	/* Userspace changed the hardware state behind the kernel's back */
-	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
-
-	dev_dbg(&slave->dev, "starting command\n");
-
 	if (cmd == 0) {
-		const struct firmware *fw;
-
 		ret = request_firmware(&fw, firmware_file, &slave->dev);
 		if (ret < 0) {
 			dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
 			goto out;
 		}
-
-		if (fw->size != num_bytes) {
+		if (fw->size < num_bytes) {
 			dev_err(&slave->dev,
-				"firmware %s: unexpected size %zd, desired %zd\n",
+				"firmware %s: firmware size %zd, desired %zd\n",
 				firmware_file, fw->size, num_bytes);
-			release_firmware(fw);
 			goto out;
 		}
+	}
 
-		ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
-		release_firmware(fw);
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	dev_dbg(&slave->dev, "starting command\n");
+	start_t = ktime_get();
+
+	if (cmd == 0) {
+		if (cmd_type)
+			ret = do_bpt_sequence(slave, true, (u8 *)fw->data);
+		else
+			ret = sdw_nwrite_no_pm(slave, start_addr, num_bytes, fw->data);
 	} else {
-		ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
+		memset(read_buffer, 0, sizeof(read_buffer));
+
+		if (cmd_type)
+			ret = do_bpt_sequence(slave, false, read_buffer);
+		else
+			ret = sdw_nread_no_pm(slave, start_addr, num_bytes, read_buffer);
 	}
 
-	dev_dbg(&slave->dev, "command completed %d\n", ret);
+	finish_t = ktime_get();
 
 out:
+	if (fw)
+		release_firmware(fw);
+
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put(&slave->dev);
 
+	dev_dbg(&slave->dev, "command completed, num_byte %zu status %d, time %lld ms\n",
+		num_bytes, ret, div_u64(finish_t - start_t, NSEC_PER_MSEC));
+
 	return ret;
 }
 DEFINE_DEBUGFS_ATTRIBUTE(cmd_go_fops, NULL,
@@ -290,6 +341,7 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 
 	/* interface to send arbitrary commands */
 	debugfs_create_file("command", 0200, d, slave, &set_command_fops);
+	debugfs_create_file("command_type", 0200, d, slave, &set_command_type_fops);
 	debugfs_create_file("start_address", 0200, d, slave, &set_start_address_fops);
 	debugfs_create_file("num_bytes", 0200, d, slave, &set_num_bytes_fops);
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
-- 
2.43.0

