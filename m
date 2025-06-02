Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B90915CD74
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845220; cv=none; b=tDPD5AbWXICXJq8QPP+trx3019yLZb0Wd5IqdtcL+9ZyN3xjFgPF6RU0CaGMFYqBvrEsWR9NdiJHEY1zfN2Q3ZzOMhy3H0hUCDm0K+tKUZBYHqr6GgkCqb73C2HcWSf2+NyQSskK5ore+kNEFerX2SA7D4ZdR0qW+V1pFFV2MGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845220; c=relaxed/simple;
	bh=uqhiVvUTjJUz12WNnC5vQ4AYx38ysdEHyQ+YwgWYwRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S8jEx87hfzJYQMDY/8Uw5VYQBh2nObwJuusSJ1az3JSVASGYIGQ8dDD64JeOC/mQ6/D1/jMC2gpFdMpi12mZEJ52kEBKIHiqBgg17sCDEdVbIibkCmDlw0cdT7M1p1NL8J/1fBoNq8dwY8LklD3Xe1SJPwHXL/R2S/rbIQQTk6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSU7IPnO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSU7IPnO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so5402205e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748845215; x=1749450015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOEMUoWDeDY5mzeOr4SEl8dbwxhrqozXvwOKEHtHeUk=;
        b=sSU7IPnOUUi7yGcTpR5L7oLOSaKVyOCpIH90T675LubPUAtDorfV2PnXkARETVOF4E
         eSN21BtaPO4Mp3AboQeI7H5hEH9x+yuudFzdhZ+IGQe8mN4Eb3yDjXRYywwANhgBKPuD
         zmar0EDkt2RZmDoC4L5cW3BoNNUnhffc7AxjZ1AUc1sybPS27ySDo8Fu61u+rbgtVcMj
         WmMqNQf9DLHfYY0PsgSN69SvMfiXRmMi8Vbjv9weRrJKcyUhZZXgv2hajgB/hw4BwSoG
         Or1YGfToONsRlikOEfBQx5kAyQSaaIwvQ/AW4DG5BXD67E2STBTZgIYGmg99JuXluCF1
         rSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845215; x=1749450015;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOEMUoWDeDY5mzeOr4SEl8dbwxhrqozXvwOKEHtHeUk=;
        b=eoNz36h4dUTozcRrmbmz/a69zG2J6isnmy/dl3cIv5bOypop7BlTvOpHQLn/6QRYVd
         AuWISssE7+zHJBG6yPZxjkcUFzoD92u6+TJPhAHJJVL8Lu07Ufn+ZF229urLZNyfp5fk
         gApSPpzF1VHXWysD8vTlTwJyBsO+aVjAWviqi9iQQCulebehKdeyk55+mT2qTT/yoslk
         jQAmj74YPPz9lNZy7VWEavTJv6hfqRdWOa6hG5dI++DGAzv8S7O35lrf/DoxSN2k+b+j
         Nxbomt1IO43wdI3O8wgEMiKc+c/l2IO0yp4fjndUm+IMvrWHMwOsEf1F2mF0zNgLxOFu
         seDA==
X-Forwarded-Encrypted: i=1; AJvYcCWIbojpMf9Bd7yxxUkHWJnTG1jaNQAMM6VOzsEjtcrLEwJSruVpkDm+XtRzcSkuGBpnDOd27TzBx4YxKd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTBvOzCsnzxxRkEyc3nDWC/fURHjhJaBxg3+7EvMTsd7Yz2foB
	ZVRWnIYuEwNjJuqH/7Xw9TcD4xKVLUoeJzOCHixSZ5iYMa9FCz3Xt8ZZno89x8dQrLM=
X-Gm-Gg: ASbGncvS+nn2A6V5w1pZsPR0Zr+y/rGeBJGQBLY6/juZrVYCMNWQokSplxAAHWYMP2+
	dOdzoAGiATIhVGKHdx+YQck3zRtk6VvkT7gmM5bppkd/hVZwiXSmvi+1qGqt7358SXkKBZtHNmV
	3EJ17KWwOzo1s0dhAyAv1mByXdNtwH263Uqhsh2rk2jc5CrYUTsme7issQIDr3R5nvIEchVsj3S
	cv1Rv+XJqfRyDM2mdfBMR7MsHQCjvdXNFuFZBoNMW+kDLbvubjCX8Pn7tTdXo779h6c942BuM2L
	88vn3V3NsnjnYhnbIYDZRfpBa86yC17jiOfrhAfQLyZ0pK3O3dX90Ck=
X-Google-Smtp-Source: AGHT+IEhg9lSTzexUaVbkdcQrdyWsGg7a4BXZ1AHF91UKUvvwVHEH4xwEI9JAg73XATTsIBgax4M7A==
X-Received: by 2002:a05:600c:4f05:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-4511ee13fb8mr65790875e9.18.1748845215311;
        Sun, 01 Jun 2025 23:20:15 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fa24c6sm108973155e9.12.2025.06.01.23.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:20:14 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:20:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rong Tao <rtoax@foxmail.com>, ast@kernel.org,
	daniel@iogearbox.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, rtoax@foxmail.com,
	rongtao@cestc.cn, Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juntong Deng <juntong.deng@outlook.com>,
	Amery Hung <amery.hung@bytedance.com>,
	Dave Marchevsky <davemarchevsky@fb.com>,
	Hou Tao <houtao1@huawei.com>,
	"(open list:BPF (Safe Dynamic Programs and Tools))" <bpf@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
Message-ID: <202505300432.nZC50gOu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_97F8B56B340F51DB604B482FEBF012460505@qq.com>

Hi Rong,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/selftests-bpf-Add-selftests-for-bpf_task_cwd_from_pid/20250529-113933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/tencent_97F8B56B340F51DB604B482FEBF012460505%40qq.com
patch subject: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300432.nZC50gOu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505300432.nZC50gOu-lkp@intel.com/

smatch warnings:
kernel/bpf/helpers.c:2687 bpf_task_cwd_from_pid() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +2687 kernel/bpf/helpers.c

b24383bde5a454 Rong Tao     2025-05-29  2657  __bpf_kfunc int bpf_task_cwd_from_pid(s32 pid, char *buf, u32 buf_len)
b24383bde5a454 Rong Tao     2025-05-29  2658  {
b24383bde5a454 Rong Tao     2025-05-29  2659  	struct path pwd;
b24383bde5a454 Rong Tao     2025-05-29  2660  	char kpath[256], *path;
b24383bde5a454 Rong Tao     2025-05-29  2661  	struct task_struct *task;
b24383bde5a454 Rong Tao     2025-05-29  2662  
b24383bde5a454 Rong Tao     2025-05-29  2663  	if (!buf || buf_len == 0)
b24383bde5a454 Rong Tao     2025-05-29  2664  		return -EINVAL;
b24383bde5a454 Rong Tao     2025-05-29  2665  
b24383bde5a454 Rong Tao     2025-05-29  2666  	rcu_read_lock();
b24383bde5a454 Rong Tao     2025-05-29  2667  	task = pid_task(find_vpid(pid), PIDTYPE_PID);
b24383bde5a454 Rong Tao     2025-05-29  2668  	if (!task) {
b24383bde5a454 Rong Tao     2025-05-29  2669  		rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2670  		return -ESRCH;
b24383bde5a454 Rong Tao     2025-05-29  2671  	}
b24383bde5a454 Rong Tao     2025-05-29  2672  	task_lock(task);
b24383bde5a454 Rong Tao     2025-05-29  2673  	if (!task->fs) {
b24383bde5a454 Rong Tao     2025-05-29  2674  		task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2675  		return -ENOENT;

rcu_read_unlock();

b24383bde5a454 Rong Tao     2025-05-29  2676  	}
b24383bde5a454 Rong Tao     2025-05-29  2677  	get_fs_pwd(task->fs, &pwd);
b24383bde5a454 Rong Tao     2025-05-29  2678  	task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2679  	rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2680  
b24383bde5a454 Rong Tao     2025-05-29  2681  	path = d_path(&pwd, kpath, sizeof(kpath));
b24383bde5a454 Rong Tao     2025-05-29  2682  	path_put(&pwd);
b24383bde5a454 Rong Tao     2025-05-29  2683  	if (IS_ERR(path))
b24383bde5a454 Rong Tao     2025-05-29  2684  		return PTR_ERR(path);
b24383bde5a454 Rong Tao     2025-05-29  2685  
b24383bde5a454 Rong Tao     2025-05-29  2686  	strncpy(buf, path, buf_len);
b24383bde5a454 Rong Tao     2025-05-29 @2687  	return 0;
b24383bde5a454 Rong Tao     2025-05-29  2688  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

