Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9D87B17BA5;
	Thu, 26 Jun 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937549; cv=none; b=X5L3LBSWogT9M3njOeSEw0Jn36qtgx+gk4SkiIOGsBb/TM2N40MWFTbiGzuJ3A+7qAFlJD4qgHYAPla4O6hAazmADK/0IkzUsjoYqxFHvjyyGEPe3F/+iRBbhj1FRWBrL0DUG/Xz7mL/t171nDFuUtGxmuNVgVLyEXckjf+65Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937549; c=relaxed/simple;
	bh=x3hbv6u2Gc8K1qdIMcGyBKxmfk7QoqqZZywR0+F1YQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aQd6Ef2F3AAKFPWteEsIDurKN6QYyK9Ouzsqr+v1HlxOaJOQkDq8UVa2m0dZkIG45VBSQbtDYnemHuHfjWeWVm8s4uDpD8uGYivv40kZ8Bo7im3aZdusIypm6Sy1opy7BvMdGklHoNoqFqqrqx4yX66Zd3lmD82k7MTsX5imEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 92D0C604F663D;
	Thu, 26 Jun 2025 19:32:15 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jaharkes@cs.cmu.edu,
	coda@cs.cmu.edu
Cc: Su Hui <suhui@nfschina.com>,
	codalist@coda.cs.cmu.edu,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] coda: silent the warning of marco UPARG
Date: Thu, 26 Jun 2025 19:32:06 +0800
Message-Id: <20250626113205.1152137-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compile with W=1, there are many errors like this:
fs/coda/upcall.c:115:27: error: variable ‘outp’ set but not used [-Werror=unused-but-set-variable]
  115 |         union outputArgs *outp;
      |                           ^~~~

There are two usages of 'UPARG', one using outp and the other not.
Change 'UPARG' and add a new maro 'UPARG2' to silent this compile error.

Signed-off-by: Su Hui <suhui@nfschina.com>
---

Ps:
I found this when run "make allyesconfig; make W=1 fs/". After apply this
patch, there is no error for whole fs/ directory. So I think this patch
has some value for this reason. Maybe we can enable W=1 check for fs/ in
default.

 fs/coda/upcall.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
index cd6a3721f6f6..7e44afcf6ffe 100644
--- a/fs/coda/upcall.c
+++ b/fs/coda/upcall.c
@@ -62,9 +62,13 @@ static void *alloc_upcall(int opcode, int size)
 do {\
 	inp = (union inputArgs *)alloc_upcall(op, insize); \
         if (IS_ERR(inp)) { return PTR_ERR(inp); }\
-        outp = (union outputArgs *)(inp); \
         outsize = insize; \
 } while (0)
+#define UPARG2(op)\
+do {\
+	UPARG(op); \
+	outp = (union outputArgs *)(inp); \
+} while (0)
 
 #define INSIZE(tag) sizeof(struct coda_ ## tag ## _in)
 #define OUTSIZE(tag) sizeof(struct coda_ ## tag ## _out)
@@ -79,7 +83,7 @@ int venus_rootfid(struct super_block *sb, struct CodaFid *fidp)
         int insize, outsize, error;
 
         insize = SIZE(root);
-        UPARG(CODA_ROOT);
+	UPARG2(CODA_ROOT);
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 	if (!error)
@@ -97,7 +101,7 @@ int venus_getattr(struct super_block *sb, struct CodaFid *fid,
         int insize, outsize, error;
 
         insize = SIZE(getattr); 
-	UPARG(CODA_GETATTR);
+	UPARG2(CODA_GETATTR);
         inp->coda_getattr.VFid = *fid;
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
@@ -112,7 +116,6 @@ int venus_setattr(struct super_block *sb, struct CodaFid *fid,
 		  struct coda_vattr *vattr)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
 	
 	insize = SIZE(setattr);
@@ -138,7 +141,7 @@ int venus_lookup(struct super_block *sb, struct CodaFid *fid,
 
 	offset = INSIZE(lookup);
         insize = max_t(unsigned int, offset + length +1, OUTSIZE(lookup));
-	UPARG(CODA_LOOKUP);
+	UPARG2(CODA_LOOKUP);
 
         inp->coda_lookup.VFid = *fid;
 	inp->coda_lookup.name = offset;
@@ -161,7 +164,6 @@ int venus_close(struct super_block *sb, struct CodaFid *fid, int flags,
 		kuid_t uid)
 {
 	union inputArgs *inp;
-	union outputArgs *outp;
 	int insize, outsize, error;
 	
 	insize = SIZE(release);
@@ -185,7 +187,7 @@ int venus_open(struct super_block *sb, struct CodaFid *fid,
         int insize, outsize, error;
        
 	insize = SIZE(open_by_fd);
-	UPARG(CODA_OPEN_BY_FD);
+	UPARG2(CODA_OPEN_BY_FD);
 
 	inp->coda_open_by_fd.VFid = *fid;
 	inp->coda_open_by_fd.flags = flags;
@@ -209,7 +211,7 @@ int venus_mkdir(struct super_block *sb, struct CodaFid *dirfid,
 
 	offset = INSIZE(mkdir);
 	insize = max_t(unsigned int, offset + length + 1, OUTSIZE(mkdir));
-	UPARG(CODA_MKDIR);
+	UPARG2(CODA_MKDIR);
 
         inp->coda_mkdir.VFid = *dirfid;
         inp->coda_mkdir.attr = *attrs;
@@ -235,7 +237,6 @@ int venus_rename(struct super_block *sb, struct CodaFid *old_fid,
 		 const char *new_name)
 {
 	union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error; 
 	int offset, s;
 	
@@ -277,7 +278,7 @@ int venus_create(struct super_block *sb, struct CodaFid *dirfid,
 
         offset = INSIZE(create);
 	insize = max_t(unsigned int, offset + length + 1, OUTSIZE(create));
-	UPARG(CODA_CREATE);
+	UPARG2(CODA_CREATE);
 
         inp->coda_create.VFid = *dirfid;
         inp->coda_create.attr.va_mode = mode;
@@ -303,7 +304,6 @@ int venus_rmdir(struct super_block *sb, struct CodaFid *dirfid,
 		    const char *name, int length)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset;
 
@@ -326,7 +326,6 @@ int venus_remove(struct super_block *sb, struct CodaFid *dirfid,
 		    const char *name, int length)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int error=0, insize, outsize, offset;
 
         offset = INSIZE(remove);
@@ -355,7 +354,7 @@ int venus_readlink(struct super_block *sb, struct CodaFid *fid,
         
 	insize = max_t(unsigned int,
 		     INSIZE(readlink), OUTSIZE(readlink)+ *length);
-	UPARG(CODA_READLINK);
+	UPARG2(CODA_READLINK);
 
         inp->coda_readlink.VFid = *fid;
 
@@ -380,7 +379,6 @@ int venus_link(struct super_block *sb, struct CodaFid *fid,
 		  struct CodaFid *dirfid, const char *name, int len )
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset;
 
@@ -407,7 +405,6 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 		     const char *symname, int symlen)
 {
         union inputArgs *inp;
-        union outputArgs *outp;
         int insize, outsize, error;
         int offset, s;
 
@@ -440,7 +437,6 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 {
         union inputArgs *inp;
-        union outputArgs *outp; 
 	int insize, outsize, error;
 	
 	insize=SIZE(fsync);
@@ -456,7 +452,6 @@ int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 int venus_access(struct super_block *sb, struct CodaFid *fid, int mask)
 {
         union inputArgs *inp;
-        union outputArgs *outp; 
 	int insize, outsize, error;
 
 	insize = SIZE(access);
@@ -481,7 +476,7 @@ int venus_pioctl(struct super_block *sb, struct CodaFid *fid,
 	int iocsize;
 
 	insize = VC_MAXMSGSIZE;
-	UPARG(CODA_IOCTL);
+	UPARG2(CODA_IOCTL);
 
         /* build packet for Venus */
         if (data->vi.in_size > VC_MAXDATASIZE) {
@@ -554,7 +549,7 @@ int venus_statfs(struct dentry *dentry, struct kstatfs *sfs)
         int insize, outsize, error;
         
 	insize = SIZE(statfs);
-	UPARG(CODA_STATFS);
+	UPARG2(CODA_STATFS);
 
 	error = coda_upcall(coda_vcp(dentry->d_sb), insize, &outsize, inp);
 	if (!error) {
@@ -574,7 +569,6 @@ int venus_access_intent(struct super_block *sb, struct CodaFid *fid,
 			size_t count, loff_t ppos, int type)
 {
 	union inputArgs *inp;
-	union outputArgs *outp;
 	int insize, outsize, error;
 	bool finalizer =
 		type == CODA_ACCESS_TYPE_READ_FINISH ||
-- 
2.30.2

