Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA71E1DFF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772030; cv=none; b=gRLE2rcJ9m5ewDh71YIwkb1UYOD6RTlmugjzwxPZGNUmurVSEGQ6gdFpUPiZPYoaZ3qneXWYR8+IMo7m/FoL4JW0J+u2/Yww8/aBVDcIrx8gaR3F9wIOlo9NSwpK4c1TyeFQvefiruGYTMaOYPFrg7EDAWBBfTtSXh05SoAQutM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772030; c=relaxed/simple;
	bh=W44BrKOK8AS0+ffWoA1gfrvUNI6jWPJ1YWK9rj1wwQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wxv+cw9L7QIpJJsHWJzMSC8FMqX+QWecM76LX9iULy7frSB2mIroGOROdjfzrzth2d/f2paHOX/ONTETKzzWtfVlhgBb50GcCamYuQwn/+wOix+gYGYZR7rvA7MNhCIpacT9WCXKMP8juk9LzFj/wdmqcK9Zqf2dji4su8xp6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cqUn0EQF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cqUn0EQF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso14025435e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743772027; x=1744376827; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KXhq05ViDXh7e+CB6BbZ2L92h5jQPNDQUsuB4QpPaA=;
        b=cqUn0EQF0+B/oy+5D7MYYi7muFut+9v5vIKif1yRDPPA9xYSmmnrW1Dsxz/M0YNodf
         +m7rOougagv1mc5amCxY5ftbwdaY+wQfzoFlHN1bprJ/qVmw2DYO6Pp/4OpI4o4Z4+Zm
         cJikyF/aG1bxBPDZ9NQ/yACOQGEegS9Ug5O9rM/iw09tIhZtYLvTAHlBBZxsWEj8RBZY
         rvGHH1cXWc8/hWFPD2+t0ihq+y30uKPuGF6FwLU2wYs8hrL0aTg4WgW5zEqzPi2t9+6K
         s5XhKm36Rv3dWe17YO+Z7QwqpUiDm1uDuBRX4lIIHEy+WXzJVsP4qs5CyxJcfDGDoOvi
         HzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743772027; x=1744376827;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5KXhq05ViDXh7e+CB6BbZ2L92h5jQPNDQUsuB4QpPaA=;
        b=dTolVw0hWVXgSzYzTGCRSldAMgm/PTYQXThDrocGS3iQVnBo6HBIY9Yf71cH01Rbs/
         eHK1/IiF4hWXPLbyhkJ7hjc3LAnxSS5qQoupn6n4jzCmYMcxz8xRLuXNEObhwDNqkTBZ
         y2bq89vMR2UDxlDI04ICUtc4E/nnIXJ/Ezm8RGUyerVCkGrvbTar+QBbASoxe6Y8xyZ+
         /r/UOa73FbW/ON73C+nKwbOGQiKVzURN0wUqMSEK7tElmBEo/E+Q7sO/3rob3s3fZ/bm
         nepV/owBFCgvZJqvhjNzvoQUEz5UoFHvfVaFpcgjatV5GDRCMBgBkB0Z623G+0XjH2zw
         4lqA==
X-Forwarded-Encrypted: i=1; AJvYcCV6mx/ZK8iwtcu57Kf9UFcjaf8ICB1VMu8LVlS9KQW0aodDpWbx1CLu4QpXhRa1G64LesA7HYIX+SB5FAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4kRk3/IXIQuzNB5w7aUTvGtV7TfynQGqX3chONGixl3Wyr0Jx
	y6cAE7dbKCOIDxqS3Fa07KcjXY9XlqGUpKEFjNXMTgU/DHQOg5Uo9ocRMkECafVLTjASc3BElbq
	K
X-Gm-Gg: ASbGncvpEPpflgMk/i1u1lAVqYweWKQyvMrjR9Rq2Ru/Bd1nJ3SrqmAQFBgk75KLmkO
	E2RdsMWp9Z13MuxOsGrv1HJwW9YdSOHmr9XHZWVtXH29FeEO1pNXGqEVbrnBlF+Ra0FUUnTjsmH
	3QDnsKodaeITkV3a21pjz0ZYB/SQOyIein5FPls6IHuGl+71WudE6BUifqScNrh02QKu97Smje7
	y6OnFn+IXdz6EojjNB+3Ba/onhWyoFOUYR6SfxAbF9bDHHBXjMTrmlN3wk1cx+RrfJRA7TfMdje
	dkQj/8WIpvkZWGB5tu/LVjv1RcNo+W8GxrZ5wrejI0nW0auiyw==
X-Google-Smtp-Source: AGHT+IHFeLCxSi+dpe6OsYojj32lSmxQ+0JrEaVpOz7wOqLY4Kdknhz1oy9PvzMuPM+otutqMoyIGA==
X-Received: by 2002:a05:600c:1f0c:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-43ecf85db8bmr29052385e9.9.1743772026779;
        Fri, 04 Apr 2025 06:07:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec36699e0sm45610875e9.35.2025.04.04.06.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:07:06 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:07:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marc Dionne <marc.dionne@auristor.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing
 zero to 'ERR_PTR'
Message-ID: <a767137a-10fe-497c-a199-0750f8d25529@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
commit: 406fad7698f5bf21ab6b5ca195bf4b9e0b3990ed cachefiles: Fix oops in vfs_mkdir from cachefiles_get_directory
config: i386-randconfig-141-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042052.d4liiRat-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504042052.d4liiRat-lkp@intel.com/

smatch warnings:
fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +203 fs/cachefiles/namei.c

32759f7d7af545 David Howells  2021-10-21   84  struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
32759f7d7af545 David Howells  2021-10-21   85  					struct dentry *dir,
32759f7d7af545 David Howells  2021-10-21   86  					const char *dirname,
32759f7d7af545 David Howells  2021-10-21   87  					bool *_is_new)
32759f7d7af545 David Howells  2021-10-21   88  {
32759f7d7af545 David Howells  2021-10-21   89  	struct dentry *subdir;
32759f7d7af545 David Howells  2021-10-21   90  	struct path path;
32759f7d7af545 David Howells  2021-10-21   91  	int ret;
32759f7d7af545 David Howells  2021-10-21   92  
32759f7d7af545 David Howells  2021-10-21   93  	_enter(",,%s", dirname);
32759f7d7af545 David Howells  2021-10-21   94  
32759f7d7af545 David Howells  2021-10-21   95  	/* search the current directory for the element name */
32759f7d7af545 David Howells  2021-10-21   96  	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
32759f7d7af545 David Howells  2021-10-21   97  
32759f7d7af545 David Howells  2021-10-21   98  retry:
32759f7d7af545 David Howells  2021-10-21   99  	ret = cachefiles_inject_read_error();
32759f7d7af545 David Howells  2021-10-21  100  	if (ret == 0)
32759f7d7af545 David Howells  2021-10-21  101  		subdir = lookup_one_len(dirname, dir, strlen(dirname));
32759f7d7af545 David Howells  2021-10-21  102  	else
32759f7d7af545 David Howells  2021-10-21  103  		subdir = ERR_PTR(ret);
8c39b8bc82aafc David Howells  2022-01-14  104  	trace_cachefiles_lookup(NULL, dir, subdir);
32759f7d7af545 David Howells  2021-10-21  105  	if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  106  		trace_cachefiles_vfs_error(NULL, d_backing_inode(dir),
32759f7d7af545 David Howells  2021-10-21  107  					   PTR_ERR(subdir),
32759f7d7af545 David Howells  2021-10-21  108  					   cachefiles_trace_lookup_error);
32759f7d7af545 David Howells  2021-10-21  109  		if (PTR_ERR(subdir) == -ENOMEM)
32759f7d7af545 David Howells  2021-10-21  110  			goto nomem_d_alloc;
32759f7d7af545 David Howells  2021-10-21  111  		goto lookup_error;
32759f7d7af545 David Howells  2021-10-21  112  	}
32759f7d7af545 David Howells  2021-10-21  113  
32759f7d7af545 David Howells  2021-10-21  114  	_debug("subdir -> %pd %s",
32759f7d7af545 David Howells  2021-10-21  115  	       subdir, d_backing_inode(subdir) ? "positive" : "negative");
32759f7d7af545 David Howells  2021-10-21  116  
32759f7d7af545 David Howells  2021-10-21  117  	/* we need to create the subdir if it doesn't exist yet */
32759f7d7af545 David Howells  2021-10-21  118  	if (d_is_negative(subdir)) {
3929eca769b5a2 David Howells  2021-10-21  119  		ret = cachefiles_has_space(cache, 1, 0,
3929eca769b5a2 David Howells  2021-10-21  120  					   cachefiles_has_space_for_create);
32759f7d7af545 David Howells  2021-10-21  121  		if (ret < 0)
32759f7d7af545 David Howells  2021-10-21  122  			goto mkdir_error;
32759f7d7af545 David Howells  2021-10-21  123  
32759f7d7af545 David Howells  2021-10-21  124  		_debug("attempt mkdir");
32759f7d7af545 David Howells  2021-10-21  125  
32759f7d7af545 David Howells  2021-10-21  126  		path.mnt = cache->mnt;
32759f7d7af545 David Howells  2021-10-21  127  		path.dentry = dir;
32759f7d7af545 David Howells  2021-10-21  128  		ret = security_path_mkdir(&path, subdir, 0700);
32759f7d7af545 David Howells  2021-10-21  129  		if (ret < 0)
32759f7d7af545 David Howells  2021-10-21  130  			goto mkdir_error;
406fad7698f5bf Marc Dionne    2025-03-25  131  		ret = cachefiles_inject_write_error();
406fad7698f5bf Marc Dionne    2025-03-25  132  		if (ret == 0)
c54b386969a581 NeilBrown      2025-02-27  133  			subdir = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), subdir, 0700);
                                                                ^^^^^^^^^^^^^^^^^^
Let's say this fails.

406fad7698f5bf Marc Dionne    2025-03-25  134  		else
406fad7698f5bf Marc Dionne    2025-03-25  135  			subdir = ERR_PTR(ret);
c54b386969a581 NeilBrown      2025-02-27  136  		if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  137  			trace_cachefiles_vfs_error(NULL, d_inode(dir), ret,
32759f7d7af545 David Howells  2021-10-21  138  						   cachefiles_trace_mkdir_error);
32759f7d7af545 David Howells  2021-10-21  139  			goto mkdir_error;

Then it means "ret" is zero and we return a NULL.  Intentional?

32759f7d7af545 David Howells  2021-10-21  140  		}
8c39b8bc82aafc David Howells  2022-01-14  141  		trace_cachefiles_mkdir(dir, subdir);
32759f7d7af545 David Howells  2021-10-21  142  
c54b386969a581 NeilBrown      2025-02-27  143  		if (unlikely(d_unhashed(subdir) || d_is_negative(subdir))) {
c54b386969a581 NeilBrown      2025-02-27  144  			dput(subdir);
32759f7d7af545 David Howells  2021-10-21  145  			goto retry;
32759f7d7af545 David Howells  2021-10-21  146  		}
32759f7d7af545 David Howells  2021-10-21  147  		ASSERT(d_backing_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  148  
32759f7d7af545 David Howells  2021-10-21  149  		_debug("mkdir -> %pd{ino=%lu}",
32759f7d7af545 David Howells  2021-10-21  150  		       subdir, d_backing_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  151  		if (_is_new)
32759f7d7af545 David Howells  2021-10-21  152  			*_is_new = true;
32759f7d7af545 David Howells  2021-10-21  153  	}
32759f7d7af545 David Howells  2021-10-21  154  
32759f7d7af545 David Howells  2021-10-21  155  	/* Tell rmdir() it's not allowed to delete the subdir */
32759f7d7af545 David Howells  2021-10-21  156  	inode_lock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  157  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  158  
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  159  	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  160  		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  161  			  subdir, d_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  162  		goto mark_error;
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  163  	}
32759f7d7af545 David Howells  2021-10-21  164  
32759f7d7af545 David Howells  2021-10-21  165  	inode_unlock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  166  
32759f7d7af545 David Howells  2021-10-21  167  	/* we need to make sure the subdir is a directory */
32759f7d7af545 David Howells  2021-10-21  168  	ASSERT(d_backing_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  169  
32759f7d7af545 David Howells  2021-10-21  170  	if (!d_can_lookup(subdir)) {
32759f7d7af545 David Howells  2021-10-21  171  		pr_err("%s is not a directory\n", dirname);
32759f7d7af545 David Howells  2021-10-21  172  		ret = -EIO;
32759f7d7af545 David Howells  2021-10-21  173  		goto check_error;
32759f7d7af545 David Howells  2021-10-21  174  	}
32759f7d7af545 David Howells  2021-10-21  175  
32759f7d7af545 David Howells  2021-10-21  176  	ret = -EPERM;
32759f7d7af545 David Howells  2021-10-21  177  	if (!(d_backing_inode(subdir)->i_opflags & IOP_XATTR) ||
32759f7d7af545 David Howells  2021-10-21  178  	    !d_backing_inode(subdir)->i_op->lookup ||
32759f7d7af545 David Howells  2021-10-21  179  	    !d_backing_inode(subdir)->i_op->mkdir ||
32759f7d7af545 David Howells  2021-10-21  180  	    !d_backing_inode(subdir)->i_op->rename ||
32759f7d7af545 David Howells  2021-10-21  181  	    !d_backing_inode(subdir)->i_op->rmdir ||
32759f7d7af545 David Howells  2021-10-21  182  	    !d_backing_inode(subdir)->i_op->unlink)
32759f7d7af545 David Howells  2021-10-21  183  		goto check_error;
32759f7d7af545 David Howells  2021-10-21  184  
32759f7d7af545 David Howells  2021-10-21  185  	_leave(" = [%lu]", d_backing_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  186  	return subdir;
32759f7d7af545 David Howells  2021-10-21  187  
32759f7d7af545 David Howells  2021-10-21  188  check_error:
32759f7d7af545 David Howells  2021-10-21  189  	cachefiles_put_directory(subdir);
32759f7d7af545 David Howells  2021-10-21  190  	_leave(" = %d [check]", ret);
32759f7d7af545 David Howells  2021-10-21  191  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  192  
32759f7d7af545 David Howells  2021-10-21  193  mark_error:
32759f7d7af545 David Howells  2021-10-21  194  	inode_unlock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  195  	dput(subdir);
32759f7d7af545 David Howells  2021-10-21  196  	return ERR_PTR(-EBUSY);
32759f7d7af545 David Howells  2021-10-21  197  
32759f7d7af545 David Howells  2021-10-21  198  mkdir_error:
32759f7d7af545 David Howells  2021-10-21  199  	inode_unlock(d_inode(dir));
c54b386969a581 NeilBrown      2025-02-27  200  	if (!IS_ERR(subdir))
32759f7d7af545 David Howells  2021-10-21  201  		dput(subdir);
32759f7d7af545 David Howells  2021-10-21  202  	pr_err("mkdir %s failed with error %d\n", dirname, ret);
32759f7d7af545 David Howells  2021-10-21 @203  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  204  
32759f7d7af545 David Howells  2021-10-21  205  lookup_error:
32759f7d7af545 David Howells  2021-10-21  206  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  207  	ret = PTR_ERR(subdir);
32759f7d7af545 David Howells  2021-10-21  208  	pr_err("Lookup %s failed with error %d\n", dirname, ret);
32759f7d7af545 David Howells  2021-10-21  209  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  210  
32759f7d7af545 David Howells  2021-10-21  211  nomem_d_alloc:
32759f7d7af545 David Howells  2021-10-21  212  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  213  	_leave(" = -ENOMEM");
32759f7d7af545 David Howells  2021-10-21  214  	return ERR_PTR(-ENOMEM);
32759f7d7af545 David Howells  2021-10-21  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

