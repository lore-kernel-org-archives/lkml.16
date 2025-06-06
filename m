Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC661E1A3B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749189428; cv=none; b=nry0RnF76+Pg+VbusxvlDaVDxyd8InRVukHULJNSGt+Y/CasU4lBa6ipJYybbk1IxGXraRBZ/oZTu1nhJjpSgmr2C3UdbdL8tox3coIB0J688AnYAfIhmL5pOZri5KsASey42oYn7InJSUOEWT0fsLRKimdz67y9x8TA/9PrZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749189428; c=relaxed/simple;
	bh=HVE1G+Z5i7ndExI2k4+eSvEduCb0IPEkjOzuhcF+PlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A69wX/1D4+PkTr00kIU9pWwDL7RFaHZZPCLsfMBLVNdlMMRd8BUIX67pBMTP93hVhyDqAzIIPVGRpP5wsZs/YlR747VOHsn8rUF0kMpZZlF0dI9AskjUV1xneib1/fJP+ucVj9EeE3zBQ68VxCVG2APrBUHAQyJVmJOOnNUIOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DcFMmYle; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DcFMmYle"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234b9dfb842so17148075ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749189426; x=1749794226; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flbL4ZAGKopRBR3RHJC7fuG7mIkT0wjs478w1oV7gYw=;
        b=DcFMmYleRSDleGws8OdoUqIh/IR8R6eTUP3ZmjU61/I5xnEijXUzjxT8JJpy7uZ1+R
         JXFOOkbgZazFnro6EhB4tuROK1bJ6jP8uQ3WG9QQR6zqyZUlh1xZfEwE/dpQKPB+0rdc
         YTzzJ55b7xYu/p2NypStLAo5vIYrpSPAAjNhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749189426; x=1749794226;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flbL4ZAGKopRBR3RHJC7fuG7mIkT0wjs478w1oV7gYw=;
        b=lpDUpEB29hUXjxlw47dcABqPFcWUUdi80j0JeblQgRgiihskngc1uV+p5AJmKeANZg
         vwVpnpg69VJA2rlKhavFh1dJCVBDlJaZRPPLeVGZ41q3KE6ZLAl3qZtuSLfLPwA+PBjK
         rrVoSTTdcrUOe5IJ6ScmP1K+RrpgHV1ywQEsy7ZSjEOkTpPR8R4CV0Y1UxtEGXOnY3w6
         bPZ/x4VAAeArbVxb4E5RweGYhiG5XM5HlCgr/e0Shpfv1D65ZwMgFK1YZbHfg004hc1h
         NYE4YDlSqd0tgdM0GwZpEyDmie0vz6hEXqoj22uOg4sEzTmPpCXyAx/A8sKeNUsl3aW7
         PnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX52Vb4etj58XJGkSoYKTyXrCRgUoqqFM87fOjUtlsojmOHTIZ4h+6lrGLUqviVl4y20Ow5EqIkZmqddzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJJrM/tsseIC3GF3ZavsJ8gU//bY9q3gK/iDKrvImePjplPog
	f+6jmb4YDa6v9VPcpJAR0dY+faJBpDchz3U77a4xgq0AUtTycznaSnuGp90kakZrDLchx6WtqgP
	cY50=
X-Gm-Gg: ASbGnctMtePmVvwsAVA8XDcx28yW2xO4/Q3BDHjriNijbHxWxtp2+7/gxCtUJXu5Bbz
	BopA2e+NBUhFkuu2ZyIMaEdfw1LA+Z5rZUnm2jLT35U8p0L3oJX6D1L+/pdzsUXKa0/9QFTx2Dv
	63nGMbEmxPMuDDn0LxJM7yJrUdvU5RKJn4kL1m68nwOh11KuZeGzTMVwpOgL+zJLh+gALkHtHN9
	3obqGe/T/wW3jiT/AcgpR/fkIAf5jkt5JWpfukJ9Yfsyjf4Ew23WtYof/Yq1F9jFXCAiRpy6AAl
	so0RYpvGP4clGPZ5J+sCLW9G9D8t0N1NXU/xwXGP0jZLHog9YXk9k0qm+ehPajx/4g==
X-Google-Smtp-Source: AGHT+IEgAbjDW+mS+YznEbzmeIXBrYaqMOw6H2788sgyRAnufkSPuz90MitCidMrgGnO9vwICzwPgw==
X-Received: by 2002:a17:903:41cf:b0:234:dd3f:80fd with SMTP id d9443c01a7336-23601cf0ceemr31019615ad.2.1749189425909;
        Thu, 05 Jun 2025 22:57:05 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:9926:e211:3810:bb30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcf39sm5189745ad.93.2025.06.05.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 22:57:05 -0700 (PDT)
Date: Fri, 6 Jun 2025 14:57:01 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: fuse: suspend blockers
Message-ID: <jofz5aw5pd2ver3mkwjeljyqsy4htsg6peaezmax4vw4lhvyjp@jphornopqgmr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

We are seeing a number of cases when blocked fuse requests prevent
the system from suspending, which is a little important on laptops.
Usually something like this:

[ 36.281038] Freezing user space processes
[ 56.284961] Freezing user space processes failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
[ 56.285069] task:secagentd state:D stack:0 pid:1792 ppid:1711 flags:0x00004006
[ 56.285084] Call Trace:
[ 56.285091] <TASK>
[ 56.285111] schedule+0x612/0x2230
[ 56.285136] fuse_get_req+0x108/0x2d0
[ 56.285179] fuse_simple_request+0x40/0x630
[ 56.285203] fuse_getxattr+0x15d/0x1c0
[...]

Which looks like wait_event_killable_exclusive() in fuse_get_req().
And we were wondering if we could do something about it.  For example,
perhaps, something like:

---

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index f182a4ca1bb32..587cea3a0407d 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -241,7 +241,7 @@ static struct fuse_req *fuse_get_req(struct fuse_conn *fc, bool for_background)
 
        if (fuse_block_alloc(fc, for_background)) {
                err = -EINTR;
-               if (wait_event_killable_exclusive(fc->blocked_waitq,
+               if (wait_event_freezable_killable_exclusive(fc->blocked_waitq,
                                !fuse_block_alloc(fc, for_background)))
                        goto out;
        }
diff --git a/include/linux/wait.h b/include/linux/wait.h
index 5b65f720261a9..1c8fdf1e02785 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -628,6 +628,19 @@ do {                                                                               \
        __ret;                                                                  \
 })
 
+#define __wait_event_freezable_killable_exclusive(wq, condition)               \
+       ___wait_event(wq, condition, TASK_KILLABLE, 1, 0,                       \
+                     freezable_schedule())
+
+#define wait_event_freezable_killable_exclusive(wq, condition)                 \
+({                                                                             \
+       int __ret = 0;                                                          \
+       might_sleep();                                                          \
+       if (!(condition))                                                       \
+               __ret = __wait_event_freezable_killable_exclusive(wq,           \
+                                                                 condition);   \
+       __ret;                                                                  \
+})
 
 #define __wait_event_freezable_exclusive(wq, condition)                                \
        ___wait_event(wq, condition, TASK_INTERRUPTIBLE, 1, 0,                  \

---

Would this be a terrible idea?
