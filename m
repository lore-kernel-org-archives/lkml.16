Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAC42AB4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864306; cv=none; b=hme1tOEGGGZeH1snbd8lL6dnHQ3CzqzQPQUf67q2YEZef9mKMkglbEz++u62Y32KoSIru7RfsN2fnyEuJUBKROBacSARO84NhzjPU2JRLGm9RPbcegPFx8x/dBiShnhQCUjP7xU7lneDywPsHlPLGx/x+a+AYVuv/Xv708WlNLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864306; c=relaxed/simple;
	bh=u3ko6WgmzTTetxwx3JM7rYtkUYpifNxeVSqSH+RuYoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRjmylW727kKjs2qROOSa97LDcHuwptjqiGVOOP7Mhqgg3Fy5+BEsd/KedhwwnbxcatrCX7AxAEzRpmjZcPnPGdvOEI+P1NiUaxUd8HyL8N/A6A00YvF1rjEx5Xcou4KawlIxCFo+XO/7oqOa62sgLxCP4/KuXlodRcslBFOK18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=e9k+A3x/; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="e9k+A3x/"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl663c58zlgTy0;
	Thu,  6 Feb 2025 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864284; x=1741456285; bh=7NdsE
	CiBmN/leYtlS6fedda0Pp8yji8ADlgslThBtFM=; b=e9k+A3x/rL+5CYeM6G9L1
	JfEbJSC0fT0c7kPhl6Urr+fuIOBMp3EB1uYtv8t2YUd5o5sEoua30cE20gmt/Tih
	M/cJKBk7S5r7wGEhdr61/07UltXXxgcKlTZGZqkDD5xIClOOFq0CRQFryY9hdEFW
	DbTZhfhFOBRgGTnpuujyVYuPJX6uBW8GUUYjlE7nFcMuIU5a1cbGLxE/572L/Q8b
	hMqQqXjsiX1rgssaL8kkDZxSifuruDFKqiuafHv6rGcEb2hxr3GdGBB1/xEv2wWi
	bibmop7YWd7Z/x30wLoJcjki3K4AA/meQtJgSbJGT16C5kKjoPQEYuan9HYpbgln
	g==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id m9wEA0AhKJuV; Thu,  6 Feb 2025 17:51:24 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5j6kRqzlgTwF;
	Thu,  6 Feb 2025 17:51:21 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH RFC 01/33] scsi, usb: Rename the RESERVE and RELEASE constants
Date: Thu,  6 Feb 2025 09:50:42 -0800
Message-ID: <20250206175114.1974171-2-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The RESERVE(6) and RELEASE(6) commands are obsolete SCSI commands defined
in the SCSI-2 standard. These commands have been replaced by PERSISTENT
RESERVE IN and PERSISTENT RESERVE OUT. Rename RESERVE into RESERVE_6 and
RELEASE into RELEASE_6 in preparation of introducing a new RELEASE macro =
in
the new header file include/linux/thread_safety.h.

Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/message/fusion/mptscsih.c            |  4 ++--
 drivers/scsi/aacraid/aachba.c                |  4 ++--
 drivers/scsi/arm/acornscsi.c                 |  2 +-
 drivers/scsi/ips.c                           |  8 ++++----
 drivers/scsi/megaraid.c                      | 10 +++++-----
 drivers/scsi/megaraid/megaraid_mbox.c        | 10 +++++-----
 drivers/target/target_core_device.c          |  8 ++++----
 drivers/target/target_core_pr.c              |  6 +++---
 drivers/target/target_core_spc.c             | 20 ++++++++++----------
 drivers/usb/gadget/function/f_mass_storage.c |  4 ++--
 drivers/usb/storage/debug.c                  |  4 ++--
 include/scsi/scsi_proto.h                    |  4 ++--
 include/trace/events/scsi.h                  |  4 ++--
 include/trace/events/target.h                |  4 ++--
 14 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/message/fusion/mptscsih.c b/drivers/message/fusion/m=
ptscsih.c
index a9604ba3c805..f0746db92ca6 100644
--- a/drivers/message/fusion/mptscsih.c
+++ b/drivers/message/fusion/mptscsih.c
@@ -2915,14 +2915,14 @@ mptscsih_do_cmd(MPT_SCSI_HOST *hd, INTERNAL_CMD *=
io)
 		timeout =3D 10;
 		break;
=20
-	case RESERVE:
+	case RESERVE_6:
 		cmdLen =3D 6;
 		dir =3D MPI_SCSIIO_CONTROL_READ;
 		CDB[0] =3D cmd;
 		timeout =3D 10;
 		break;
=20
-	case RELEASE:
+	case RELEASE_6:
 		cmdLen =3D 6;
 		dir =3D MPI_SCSIIO_CONTROL_READ;
 		CDB[0] =3D cmd;
diff --git a/drivers/scsi/aacraid/aachba.c b/drivers/scsi/aacraid/aachba.=
c
index abf6a82b74af..0be719f38377 100644
--- a/drivers/scsi/aacraid/aachba.c
+++ b/drivers/scsi/aacraid/aachba.c
@@ -3221,8 +3221,8 @@ int aac_scsi_cmd(struct scsi_cmnd * scsicmd)
 			break;
 		}
 		fallthrough;
-	case RESERVE:
-	case RELEASE:
+	case RESERVE_6:
+	case RELEASE_6:
 	case REZERO_UNIT:
 	case REASSIGN_BLOCKS:
 	case SEEK_10:
diff --git a/drivers/scsi/arm/acornscsi.c b/drivers/scsi/arm/acornscsi.c
index e50a3dbf9de3..ef21b85cf014 100644
--- a/drivers/scsi/arm/acornscsi.c
+++ b/drivers/scsi/arm/acornscsi.c
@@ -591,7 +591,7 @@ datadir_t acornscsi_datadirection(int command)
     case CHANGE_DEFINITION:	case COMPARE:		case COPY:
     case COPY_VERIFY:		case LOG_SELECT:	case MODE_SELECT:
     case MODE_SELECT_10:	case SEND_DIAGNOSTIC:	case WRITE_BUFFER:
-    case FORMAT_UNIT:		case REASSIGN_BLOCKS:	case RESERVE:
+    case FORMAT_UNIT:		case REASSIGN_BLOCKS:	case RESERVE_6:
     case SEARCH_EQUAL:		case SEARCH_HIGH:	case SEARCH_LOW:
     case WRITE_6:		case WRITE_10:		case WRITE_VERIFY:
     case UPDATE_BLOCK:		case WRITE_LONG:	case WRITE_SAME:
diff --git a/drivers/scsi/ips.c b/drivers/scsi/ips.c
index cce6c6b409ad..94adb6ac02a4 100644
--- a/drivers/scsi/ips.c
+++ b/drivers/scsi/ips.c
@@ -3631,8 +3631,8 @@ ips_send_cmd(ips_ha_t * ha, ips_scb_t * scb)
=20
 			break;
=20
-		case RESERVE:
-		case RELEASE:
+		case RESERVE_6:
+		case RELEASE_6:
 			scb->scsi_cmd->result =3D DID_OK << 16;
 			break;
=20
@@ -3899,8 +3899,8 @@ ips_chkstatus(ips_ha_t * ha, IPS_STATUS * pstatus)
 			case WRITE_6:
 			case READ_10:
 			case WRITE_10:
-			case RESERVE:
-			case RELEASE:
+			case RESERVE_6:
+			case RELEASE_6:
 				break;
=20
 			case MODE_SENSE:
diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index adab151663dd..2006094af418 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -855,8 +855,8 @@ mega_build_cmd(adapter_t *adapter, struct scsi_cmnd *=
cmd, int *busy)
 			return scb;
=20
 #if MEGA_HAVE_CLUSTERING
-		case RESERVE:
-		case RELEASE:
+		case RESERVE_6:
+		case RELEASE_6:
=20
 			/*
 			 * Do we support clustering and is the support enabled
@@ -875,7 +875,7 @@ mega_build_cmd(adapter_t *adapter, struct scsi_cmnd *=
cmd, int *busy)
 			}
=20
 			scb->raw_mbox[0] =3D MEGA_CLUSTER_CMD;
-			scb->raw_mbox[2] =3D ( *cmd->cmnd =3D=3D RESERVE ) ?
+			scb->raw_mbox[2] =3D *cmd->cmnd =3D=3D RESERVE_6 ?
 				MEGA_RESERVE_LD : MEGA_RELEASE_LD;
=20
 			scb->raw_mbox[3] =3D ldrv_num;
@@ -1618,8 +1618,8 @@ mega_cmd_done(adapter_t *adapter, u8 completed[], i=
nt nstatus, int status)
 			 * failed or the input parameter is invalid
 			 */
 			if( status =3D=3D 1 &&
-				(cmd->cmnd[0] =3D=3D RESERVE ||
-					 cmd->cmnd[0] =3D=3D RELEASE) ) {
+			    (cmd->cmnd[0] =3D=3D RESERVE_6 ||
+			     cmd->cmnd[0] =3D=3D RELEASE_6) ) {
=20
 				cmd->result |=3D (DID_ERROR << 16) |
 					SAM_STAT_RESERVATION_CONFLICT;
diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megarai=
d/megaraid_mbox.c
index 60cc3372991f..3ba837b3093f 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -1725,8 +1725,8 @@ megaraid_mbox_build_cmd(adapter_t *adapter, struct =
scsi_cmnd *scp, int *busy)
=20
 			return scb;
=20
-		case RESERVE:
-		case RELEASE:
+		case RESERVE_6:
+		case RELEASE_6:
 			/*
 			 * Do we support clustering and is the support enabled
 			 */
@@ -1748,7 +1748,7 @@ megaraid_mbox_build_cmd(adapter_t *adapter, struct =
scsi_cmnd *scp, int *busy)
 			scb->dev_channel	=3D 0xFF;
 			scb->dev_target		=3D target;
 			ccb->raw_mbox[0]	=3D CLUSTER_CMD;
-			ccb->raw_mbox[2]	=3D  (scp->cmnd[0] =3D=3D RESERVE) ?
+			ccb->raw_mbox[2]	=3D scp->cmnd[0] =3D=3D RESERVE_6 ?
 						RESERVE_LD : RELEASE_LD;
=20
 			ccb->raw_mbox[3]	=3D target;
@@ -2334,8 +2334,8 @@ megaraid_mbox_dpc(unsigned long devp)
 			 * Error code returned is 1 if Reserve or Release
 			 * failed or the input parameter is invalid
 			 */
-			if (status =3D=3D 1 && (scp->cmnd[0] =3D=3D RESERVE ||
-					 scp->cmnd[0] =3D=3D RELEASE)) {
+			if (status =3D=3D 1 && (scp->cmnd[0] =3D=3D RESERVE_6 ||
+					    scp->cmnd[0] =3D=3D RELEASE_6)) {
=20
 				scp->result =3D DID_ERROR << 16 |
 					SAM_STAT_RESERVATION_CONFLICT;
diff --git a/drivers/target/target_core_device.c b/drivers/target/target_=
core_device.c
index d1ae3df069a4..cc2da086f96e 100644
--- a/drivers/target/target_core_device.c
+++ b/drivers/target/target_core_device.c
@@ -1078,8 +1078,8 @@ passthrough_parse_cdb(struct se_cmd *cmd,
 	if (!dev->dev_attrib.emulate_pr &&
 	    ((cdb[0] =3D=3D PERSISTENT_RESERVE_IN) ||
 	     (cdb[0] =3D=3D PERSISTENT_RESERVE_OUT) ||
-	     (cdb[0] =3D=3D RELEASE || cdb[0] =3D=3D RELEASE_10) ||
-	     (cdb[0] =3D=3D RESERVE || cdb[0] =3D=3D RESERVE_10))) {
+	     (cdb[0] =3D=3D RELEASE_6 || cdb[0] =3D=3D RELEASE_10) ||
+	     (cdb[0] =3D=3D RESERVE_6 || cdb[0] =3D=3D RESERVE_10))) {
 		return TCM_UNSUPPORTED_SCSI_OPCODE;
 	}
=20
@@ -1101,7 +1101,7 @@ passthrough_parse_cdb(struct se_cmd *cmd,
 			return target_cmd_size_check(cmd, size);
 		}
=20
-		if (cdb[0] =3D=3D RELEASE || cdb[0] =3D=3D RELEASE_10) {
+		if (cdb[0] =3D=3D RELEASE_6 || cdb[0] =3D=3D RELEASE_10) {
 			cmd->execute_cmd =3D target_scsi2_reservation_release;
 			if (cdb[0] =3D=3D RELEASE_10)
 				size =3D get_unaligned_be16(&cdb[7]);
@@ -1109,7 +1109,7 @@ passthrough_parse_cdb(struct se_cmd *cmd,
 				size =3D cmd->data_length;
 			return target_cmd_size_check(cmd, size);
 		}
-		if (cdb[0] =3D=3D RESERVE || cdb[0] =3D=3D RESERVE_10) {
+		if (cdb[0] =3D=3D RESERVE_6 || cdb[0] =3D=3D RESERVE_10) {
 			cmd->execute_cmd =3D target_scsi2_reservation_reserve;
 			if (cdb[0] =3D=3D RESERVE_10)
 				size =3D get_unaligned_be16(&cdb[7]);
diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core=
_pr.c
index 4f4ad6af416c..34cf2c399b39 100644
--- a/drivers/target/target_core_pr.c
+++ b/drivers/target/target_core_pr.c
@@ -91,7 +91,7 @@ target_scsi2_reservation_check(struct se_cmd *cmd)
=20
 	switch (cmd->t_task_cdb[0]) {
 	case INQUIRY:
-	case RELEASE:
+	case RELEASE_6:
 	case RELEASE_10:
 		return 0;
 	default:
@@ -418,12 +418,12 @@ static int core_scsi3_pr_seq_non_holder(struct se_c=
md *cmd, u32 pr_reg_type,
 			return -EINVAL;
 		}
 		break;
-	case RELEASE:
+	case RELEASE_6:
 	case RELEASE_10:
 		/* Handled by CRH=3D1 in target_scsi2_reservation_release() */
 		ret =3D 0;
 		break;
-	case RESERVE:
+	case RESERVE_6:
 	case RESERVE_10:
 		/* Handled by CRH=3D1 in target_scsi2_reservation_reserve() */
 		ret =3D 0;
diff --git a/drivers/target/target_core_spc.c b/drivers/target/target_cor=
e_spc.c
index ea14a3835681..278ff93eff24 100644
--- a/drivers/target/target_core_spc.c
+++ b/drivers/target/target_core_spc.c
@@ -1674,9 +1674,9 @@ static bool tcm_is_pr_enabled(struct target_opcode_=
descriptor *descr,
 		return true;
=20
 	switch (descr->opcode) {
-	case RESERVE:
+	case RESERVE_6:
 	case RESERVE_10:
-	case RELEASE:
+	case RELEASE_6:
 	case RELEASE_10:
 		/*
 		 * The pr_ops which are used by the backend modules don't
@@ -1828,9 +1828,9 @@ static struct target_opcode_descriptor tcm_opcode_p=
ro_register_move =3D {
=20
 static struct target_opcode_descriptor tcm_opcode_release =3D {
 	.support =3D SCSI_SUPPORT_FULL,
-	.opcode =3D RELEASE,
+	.opcode =3D RELEASE_6,
 	.cdb_size =3D 6,
-	.usage_bits =3D {RELEASE, 0x00, 0x00, 0x00,
+	.usage_bits =3D {RELEASE_6, 0x00, 0x00, 0x00,
 		       0x00, SCSI_CONTROL_MASK},
 	.enabled =3D tcm_is_pr_enabled,
 };
@@ -1847,9 +1847,9 @@ static struct target_opcode_descriptor tcm_opcode_r=
elease10 =3D {
=20
 static struct target_opcode_descriptor tcm_opcode_reserve =3D {
 	.support =3D SCSI_SUPPORT_FULL,
-	.opcode =3D RESERVE,
+	.opcode =3D RESERVE_6,
 	.cdb_size =3D 6,
-	.usage_bits =3D {RESERVE, 0x00, 0x00, 0x00,
+	.usage_bits =3D {RESERVE_6, 0x00, 0x00, 0x00,
 		       0x00, SCSI_CONTROL_MASK},
 	.enabled =3D tcm_is_pr_enabled,
 };
@@ -2267,9 +2267,9 @@ spc_parse_cdb(struct se_cmd *cmd, unsigned int *siz=
e)
 	unsigned char *cdb =3D cmd->t_task_cdb;
=20
 	switch (cdb[0]) {
-	case RESERVE:
+	case RESERVE_6:
 	case RESERVE_10:
-	case RELEASE:
+	case RELEASE_6:
 	case RELEASE_10:
 		if (!dev->dev_attrib.emulate_pr)
 			return TCM_UNSUPPORTED_SCSI_OPCODE;
@@ -2313,7 +2313,7 @@ spc_parse_cdb(struct se_cmd *cmd, unsigned int *siz=
e)
 		*size =3D get_unaligned_be32(&cdb[5]);
 		cmd->execute_cmd =3D target_scsi3_emulate_pr_out;
 		break;
-	case RELEASE:
+	case RELEASE_6:
 	case RELEASE_10:
 		if (cdb[0] =3D=3D RELEASE_10)
 			*size =3D get_unaligned_be16(&cdb[7]);
@@ -2322,7 +2322,7 @@ spc_parse_cdb(struct se_cmd *cmd, unsigned int *siz=
e)
=20
 		cmd->execute_cmd =3D target_scsi2_reservation_release;
 		break;
-	case RESERVE:
+	case RESERVE_6:
 	case RESERVE_10:
 		/*
 		 * The SPC-2 RESERVE does not contain a size in the SCSI CDB.
diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/g=
adget/function/f_mass_storage.c
index 2eae8fc2e0db..94d478b6bcd3 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2142,8 +2142,8 @@ static int do_scsi_command(struct fsg_common *commo=
n)
 	 * of Posix locks.
 	 */
 	case FORMAT_UNIT:
-	case RELEASE:
-	case RESERVE:
+	case RELEASE_6:
+	case RESERVE_6:
 	case SEND_DIAGNOSTIC:
=20
 	default:
diff --git a/drivers/usb/storage/debug.c b/drivers/usb/storage/debug.c
index 576be66ad962..dda610f689b7 100644
--- a/drivers/usb/storage/debug.c
+++ b/drivers/usb/storage/debug.c
@@ -58,8 +58,8 @@ void usb_stor_show_command(const struct us_data *us, st=
ruct scsi_cmnd *srb)
 	case INQUIRY: what =3D "INQUIRY"; break;
 	case RECOVER_BUFFERED_DATA: what =3D "RECOVER_BUFFERED_DATA"; break;
 	case MODE_SELECT: what =3D "MODE_SELECT"; break;
-	case RESERVE: what =3D "RESERVE"; break;
-	case RELEASE: what =3D "RELEASE"; break;
+	case RESERVE_6: what =3D "RESERVE"; break;
+	case RELEASE_6: what =3D "RELEASE"; break;
 	case COPY: what =3D "COPY"; break;
 	case ERASE: what =3D "ERASE"; break;
 	case MODE_SENSE: what =3D "MODE_SENSE"; break;
diff --git a/include/scsi/scsi_proto.h b/include/scsi/scsi_proto.h
index 70e1262b2e20..aeca37816506 100644
--- a/include/scsi/scsi_proto.h
+++ b/include/scsi/scsi_proto.h
@@ -33,8 +33,8 @@
 #define INQUIRY               0x12
 #define RECOVER_BUFFERED_DATA 0x14
 #define MODE_SELECT           0x15
-#define RESERVE               0x16
-#define RELEASE               0x17
+#define RESERVE_6             0x16
+#define RELEASE_6             0x17
 #define COPY                  0x18
 #define ERASE                 0x19
 #define MODE_SENSE            0x1a
diff --git a/include/trace/events/scsi.h b/include/trace/events/scsi.h
index 05f1945ed204..bf6cc98d9122 100644
--- a/include/trace/events/scsi.h
+++ b/include/trace/events/scsi.h
@@ -29,8 +29,8 @@
 		scsi_opcode_name(INQUIRY),			\
 		scsi_opcode_name(RECOVER_BUFFERED_DATA),	\
 		scsi_opcode_name(MODE_SELECT),			\
-		scsi_opcode_name(RESERVE),			\
-		scsi_opcode_name(RELEASE),			\
+		scsi_opcode_name(RESERVE_6),			\
+		scsi_opcode_name(RELEASE_6),			\
 		scsi_opcode_name(COPY),				\
 		scsi_opcode_name(ERASE),			\
 		scsi_opcode_name(MODE_SENSE),			\
diff --git a/include/trace/events/target.h b/include/trace/events/target.=
h
index a13cbf2b3405..7e2e20ba26f1 100644
--- a/include/trace/events/target.h
+++ b/include/trace/events/target.h
@@ -31,8 +31,8 @@
 		scsi_opcode_name(INQUIRY),			\
 		scsi_opcode_name(RECOVER_BUFFERED_DATA),	\
 		scsi_opcode_name(MODE_SELECT),			\
-		scsi_opcode_name(RESERVE),			\
-		scsi_opcode_name(RELEASE),			\
+		scsi_opcode_name(RESERVE_6),			\
+		scsi_opcode_name(RELEASE_6),			\
 		scsi_opcode_name(COPY),				\
 		scsi_opcode_name(ERASE),			\
 		scsi_opcode_name(MODE_SENSE),			\
