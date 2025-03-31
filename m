Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8DF13A258
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743414241; cv=none; b=D8167FiF9OxsgOtm6C75pFRG65waSTbc/ErqLbTIE3MseHwfDsurzII0cz9nLY3x4Hj365D1I9vbbi//gmyAnTaop3cXsFZgdhqz+IIVW5nfJvUIqOvigQdq+7729Dvzi/H/LWeNkME2Gz96Gd9hEy1/yPX4Keev6Nq9ebUPdWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743414241; c=relaxed/simple;
	bh=uUjD/JplIhUXWecod63ucSrmW7jQiOn8s98ndmFloPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKVZdiRPIlY+dhBWCbRIHHpi0bUTZJS8P//B77qqn1JpKTdC7fMIErFjKOv6aKPCdqIZ1Ub62Hdnm1En8Q2Cq2TTIxmle4/bSQ+Cyi24nBIQWss6f/R0Tony1F7lR/wHGvpZXA1UDp4R383xc61vISjmrRldME7XxzgsQ1Rnr7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A28jRfxv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A28jRfxv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso139612f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743414238; x=1744019038; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GLv/TlK6NwyIX5eMw+b9bXsE/bqtOYXg8Tuj7RGPR8=;
        b=A28jRfxvIu8GBjwAYzRMv6lOu0+owUfyBnAUwGYZQ2+D7TqD5bXpO0IJX8McvIxNs5
         jqZJpKzkWzgoGquqmtKethcEr+DDgeO02HvoU62WgwQE4VFMpiiTRKNyIpGsFZEwUcTz
         xNKfgJE4r1wyktZs8LrZbSBrKlCbxEeOjQhp6e+csRzU624SE7v7u3OOItVgdMqOy9BQ
         kOHLtJdtUxFWlCkP/IQoy/+x178IXOMgNbwjLAH1t9Bd3+h/OPQ1WnoI3tUeYUKU6h8h
         XFPLfINH+JUYRzfk4RoplojEEGh1aDX03SB8UF4ydAfBYvqBya/gYTt/k/+IdWlKTCdN
         bvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743414238; x=1744019038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GLv/TlK6NwyIX5eMw+b9bXsE/bqtOYXg8Tuj7RGPR8=;
        b=mnsKZFiejzpNu5PKNXTm6IcDeO336j1L14xwb4cLTZJDdkxYov2gCgoDBKNLZR4uqS
         pHS9uSgIqk75VexfFpuN7iNblx7QzYmQcJseco4ZfYxhIJylvMEWNv24QgnS4YmRemmJ
         VLL0Zo5mk3uYSKrbxFPgkZfRqTU1SLTP2vS3+VW6loJasqZr7n5SrtUYyyOpsgpTpyk1
         yJ9wJ/P7NEKYgDnnP45CA5T9sHszlEkU8J1YPDCWrzcwKKMw08NqgVz2ieB/a0PFiqDW
         nt/13BA8Xl60W7SOOHPWX1Y3pQaKTECJldjpLS+d6slfSO6sMvKHXaFBzmx0ZqzGrVqP
         z0ww==
X-Forwarded-Encrypted: i=1; AJvYcCXMYXhSHcvuHscrYIKGQe6LG270pU4l9lXRg20U5cjaGVCuKcQZ5cKYf1SheMv5uYA9U21qXxCYpvfjDKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3pwsabAxonmM86II3GoYv2lqK6uodjDgZDoX8WTyPKF6B15BC
	pDvB3Wq84b5v5Zm1wE5kyjHwe3dyqqhmZRjPJONB/vz3L2B55BtCbrI6mmy3GzE=
X-Gm-Gg: ASbGnctloeoI28rPq5YAbwN5xqxSzwqgG3bPw9CZdneS7HkSppxrWfxee+Syh42EX0x
	6ucgkffv+e8xcvENammcUN9bJjcaSI8Xa0FGzpLA1JGjJk5AYroBxG2U0FK1jFiPNJM7i1in+K1
	hVo/ZLPJaaE20YS4Nqf8dHaI+XP62SL+EsUxJhkksviXGDv9eqcnbG/iZGe7XBmTnoW4khIosbi
	gG0t777t0jtJkBG4FzR9NnyJw49Jq4wWE/drqU0avlwcpmEaDVGTFNh2oKO7Lc18VR2Srygqp5T
	5qEvwQ6VYq56BFVLjaHbLkZGqMHoACEKlvmOW6hedNMkmoKEhA==
X-Google-Smtp-Source: AGHT+IGs/AIKyAlURq/RRfCeu90iBXK3gpoSTRjgemLZoshu9Cg+ZXrGip1/5AfFeNfBa9hppYpv6A==
X-Received: by 2002:a05:6000:2a8:b0:391:3156:6be with SMTP id ffacd0b85a97d-39c11b7dae8mr6990133f8f.7.1743414237995;
        Mon, 31 Mar 2025 02:43:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e0afsm10922362f8f.65.2025.03.31.02.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:43:57 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:43:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Gabriele Monaco <gmonaco@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent
 returns 'global &rv_interface_lock'.
Message-ID: <bc1fe7c1-a042-42b2-8d40-7621ef0087b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for nested monitors and include sched
config: parisc-randconfig-r073-20250331 (https://download.01.org/0day-ci/archive/20250331/202503310539.7BDDOPxq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503310539.7BDDOPxq-lkp@intel.com/

smatch warnings:
kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent returns 'global &rv_interface_lock'.

vim +838 kernel/trace/rv/rv.c

cb85c660fcd4b3a Gabriele Monaco            2025-03-05  779  int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  780  {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  781  	struct rv_monitor_def *r, *p = NULL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  782  	int retval = 0;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  783  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  784  	if (strlen(monitor->name) >= MAX_RV_MONITOR_NAME_SIZE) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  785  		pr_info("Monitor %s has a name longer than %d\n", monitor->name,
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  786  			MAX_RV_MONITOR_NAME_SIZE);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  787  		return -EINVAL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  788  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  789  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  790  	mutex_lock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  791  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  792  	list_for_each_entry(r, &rv_monitors_list, list) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  793  		if (strcmp(monitor->name, r->monitor->name) == 0) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  794  			pr_info("Monitor %s is already registered\n", monitor->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  795  			retval = -EEXIST;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  796  			goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  797  		}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  798  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  799  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  800  	if (parent) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  801  		list_for_each_entry(r, &rv_monitors_list, list) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  802  			if (strcmp(parent->name, r->monitor->name) == 0) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  803  				p = r;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  804  				break;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  805  			}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  806  		}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  807  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  808  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  809  	if (p && rv_is_nested_monitor(p)) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  810  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  811  			parent->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  812  		return -EINVAL;

mutex_unlock(&rv_interface_lock);

cb85c660fcd4b3a Gabriele Monaco            2025-03-05  813  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  814  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  815  	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  816  	if (!r) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  817  		retval = -ENOMEM;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  818  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  819  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  820  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  821  	r->monitor = monitor;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  822  	r->parent = parent;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  823  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  824  	retval = create_monitor_dir(r, p);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  825  	if (retval) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  826  		kfree(r);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  827  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  828  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  829  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  830  	/* keep children close to the parent for easier visualisation */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  831  	if (p)
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  832  		list_add(&r->list, &p->list);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  833  	else
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  834  		list_add_tail(&r->list, &rv_monitors_list);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  835  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  836  out_unlock:
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  837  	mutex_unlock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29 @838  	return retval;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  839  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

