Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019F86340
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086533; cv=none; b=J2v0HcSVQiVpJJb8ox1JCtpzrgVYpYEcL+QrXKW33ThQ2CId9G0mtmD37HxvZLWUJdejZ3LnXX7dh9xYXYD/963h+4Sh9pCwxItnSn7076FBIEJo5HR5pSWx5ht1e1wBYuaYeVxxtW3eCs2YG7Vz0ACiNakqZgMHJ/O8NSfRJoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086533; c=relaxed/simple;
	bh=yCdpC7+BkZ97SbLJnzA+XwfLHKGSnF3b711oUYDyWvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3rRQP2C5hZFOO/g/3e/M3Qv+rBt2JMuzdR5S8UN4rWlGyu+q05InT6LxAjSz5LZ4SMYLFThCvcmxlA6dU0AXpQA7Ak4ZSLspgJmxIqPJxCd9lrsFxa/kJdNQ9KP7u8/qXpH26uyUIEC3w7+QUjSu3y/ldw+1aQUTZXTj/6rAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VG92VnFW; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VG92VnFW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750086521; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=45TM9TQRagX2IF5SvAUP0uNlAbenpANguVySgK/vH8U=;
	b=VG92VnFWy+1//Ri3fUEdyJO1pMnd3gCzVeqJd6zbG9qmj3AKODRoHWcUWWtm0dP5BhXodGxn5CIYKWKpCJb/jymMgNJIAtqBQH4VbhxZpy0H7gHTOLjgTB2cTgnnJwp8REG9MWU2cpvFAutpKJMmlyOpLH/Q9lhnFQz9X9cMAjM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0We.J-ww_1750086519 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 23:08:39 +0800
Date: Mon, 16 Jun 2025 23:08:38 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	paulmck@kernel.org, john.ogness@linutronix.de
Subject: Re: [PATCH V2 3/5] sys_info: add help to translate sys_info string
 to bitmap
Message-ID: <aFAzdsx_WbpNsupZ@U-2FWC9VHC-2323.local>
References: <20250616010840.38258-4-feng.tang@linux.alibaba.com>
 <202506161234.wRZSzo5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202506161234.wRZSzo5v-lkp@intel.com>

On Mon, Jun 16, 2025 at 12:25:29PM +0800, kernel test robot wrote:
> Hi Feng,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-nonmm-unstable]
> [also build test WARNING on akpm-mm/mm-everything linus/master v6.16-rc2 next-20250613]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/panic-clean-up-code-for-console-replay/20250616-091042
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> patch link:    https://lore.kernel.org/r/20250616010840.38258-4-feng.tang%40linux.alibaba.com
> patch subject: [PATCH V2 3/5] sys_info: add help to translate sys_info string to bitmap
> config: x86_64-buildonly-randconfig-001-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161234.wRZSzo5v-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161234.wRZSzo5v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506161234.wRZSzo5v-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> lib/sys_info.c:13:19: warning: unused variable 'sys_info_avail' [-Wunused-const-variable]
>       13 | static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
>          |                   ^~~~~~~~~~~~~~
>    1 warning generated.

Thanks for the reporting! This is related with CONFIG_SYSCTL=n, and
should be fixed by below patch:

---
diff --git a/lib/sys_info.c b/lib/sys_info.c
index 9693542435ba..ca289b4871b4 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -10,8 +10,6 @@ struct sys_info_name {
 	const char *name;
 };
 
-static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
-
 static const struct sys_info_name  si_names[] = {
 	{ SYS_SHOW_TASK_INFO,	"tasks" },
 	{ SYS_SHOW_MEM_INFO,	"mem" },
@@ -43,6 +41,8 @@ unsigned long sys_info_parse_param(char *str)
 }
 
 #ifdef CONFIG_SYSCTL
+static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
+
 int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
 					  void *buffer, size_t *lenp,
 					  loff_t *ppos)

