Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBBC3B2A0
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747605040; cv=none; b=XH9Hvto75Kiw2uHwnmV62RsVLO4x/1dXs4q9P2rl1pngEO+251gJ2alR9wyg45gZl4lNq6I1H8govmtOG5a0FRBNEtmr20UHxAnhiwd/3NxFPlI/1iuOhQTsWmc7RtJiZL6Cy8/eADPIE2X2vL+oayaEe8U1Js2Jgqh8XM80hYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747605040; c=relaxed/simple;
	bh=79kKnSEMKKqJ57YQnRDp4qba0VqmcjJ6iTAvPSXrnL4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bU0lC39euF7QbXc8bgjMZ8/45Gvf9TjTFNCrmwOcjBZ9iTkGUBS2oz0XWM39gYhC4EIecvDLX4d09ZKKp8PAkxNg1kbo9vfVnZiaVlqRjKhw56pNtFGn3zUHwPVq7ipCIy/jgdgE8gdRmfTsRFIbd34MuwtkvdcyHXOLO5zPPVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh06t2Y+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dh06t2Y+"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3706ff36bso243054f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747605037; x=1748209837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dd87LfCI9WT//JyBxng83Lwb28MCQOSv3z3z3fk1VZs=;
        b=Dh06t2Y+ihP2Mh3VOJAomVRRqkkef99D/RdiLQdwJndeC4GNgZmvdaWIh7tJRt794z
         f825oxKDuWQpWyvrXPiFYQ490wxGDdmKXuVdcegtPMu7wAAfI+0/AcCPRb/xw1gsBDB4
         7I77Is/qwaEo/cpZdBYrCdKpu/xBbUi08XW1snJShJb5YoqPqSX4sa3e9T9oT9xKy+9R
         516rvHWPR3ZdWzMGy96uPiQdoJEeC49NX0+Y0ppFuEi8Q4I2163VkBh0+xCFOCyIv42E
         gcLb3LhVluXiOm5K7r+6Bt0sINrZ3wvsQ2yIONvJI3Kz4boDZShkHUQl3zzfSkTYYUBK
         2byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747605037; x=1748209837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dd87LfCI9WT//JyBxng83Lwb28MCQOSv3z3z3fk1VZs=;
        b=pYS6CdriHwORjpFFqAswJTNJUNK3NiTYsddCUdx8I+DqyA2slUWHr/pJKPtWa410xo
         PvZk3yIrV4KhdNc6FnatNLm4OCqO3xypllDpZxZUNlJmRx6ibk3/8CpRH078nlsphneo
         1eMT+NvXZYLC5wcrLXGdmXtet41VOQDQUXcdQe0D91HKswPYWEngeOSlZOvw6CA2w+Wn
         0kN7plsW/SF43uXrN4bJE7t5EItYk1j8cUA1LoORDFf+22wY1lrP4UIgsl+UWyvzeCkJ
         4SJVC+toH1BD6BQcOOL/1GTMjQup4rGI5NI+CXzFWC1ET57flBzm7doRFeX+9epA8/Lv
         aLZw==
X-Forwarded-Encrypted: i=1; AJvYcCXCmz/midjy6hcK6BIeeDg9wIYDlDxedUIHJIt5wLke7wZulSgDFcu5PhEu5QEwPwEdFwqZ9UdARbh63R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXdYiOiBVhPg0FiTt0Bqc0aDp69uW9CINjAFhWWMoHuUGPZXj
	tfhWZXq3NkjHlXp1ZihObeJVwu0nIvN8pptDx+rjo9sUF2hUmoCZLJtc
X-Gm-Gg: ASbGncuwNj7CtZwRb8o0L5JJupKfP3/j7oDWbnamPxHz5ubwh5owM8lR53+7a6WtjjW
	Ttv8Fu4tPRGkGAF4RyXsEaGijuQbS9XRDTXLEwNIwU1hJHwKF/y7x1U5x3QrxcLTrDIjFUDijcI
	pnl+Edr5YnLgC3zjhff37E2DnkY1/rMl1V1u8XdYIcwJezXAHzPbbV+3ZzYv6UkDHBapNLMb+a5
	RL3He9weHc2hIElSHODPSQasPwF4O0JlvT/Tk6Ri+uHKek05jWeL5vhT7eH4oW1DvfuERh7utmb
	fsC8iK1kFwK7RuSrsoUbOuX0lpu+dptaYHY91K+VcI0qAxm0fEZqIn+X2t9rgzLu/zySuAcI5zA
	w4qPFrwDdwbn2oA==
X-Google-Smtp-Source: AGHT+IEoBiFPjelVAhh1P9nAn5mTVvxWL2CpLAah1CB9KofEoCk75lEIDvxxHgFp9MPCtfEn5qQMcA==
X-Received: by 2002:a05:6000:430c:b0:3a3:6947:6d35 with SMTP id ffacd0b85a97d-3a369477158mr3953400f8f.57.1747605036646;
        Sun, 18 May 2025 14:50:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm10670936f8f.90.2025.05.18.14.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:50:36 -0700 (PDT)
Date: Sun, 18 May 2025 22:50:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, u.kleine-koenig@baylibre.com, Nicolas Pitre
 <npitre@baylibre.com>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for
 divide by zero
Message-ID: <20250518225035.2f887be7@pumpkin>
In-Reply-To: <202505182351.bPFZE1vO-lkp@intel.com>
References: <20250518133848.5811-3-david.laight.linux@gmail.com>
	<202505182351.bPFZE1vO-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 May 2025 23:42:44 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20250516]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/lib-mul_u64_u64_div_u64-rename-parameter-c-to-d/20250518-214037
> base:   next-20250516
> patch link:    https://lore.kernel.org/r/20250518133848.5811-3-david.laight.linux%40gmail.com
> patch subject: [PATCH v2 next 2/4] lib: mul_u64_u64_div_u64() Use BUG_ON() for divide by zero
> config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250518/202505182351.bPFZE1vO-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505182351.bPFZE1vO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505182351.bPFZE1vO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    lib/math/div64.c: In function 'mul_u64_u64_div_u64':
> >> lib/math/div64.c:190:9: error: implicit declaration of function 'BUG_ON' [-Wimplicit-function-declaration]  
>      190 |         BUG_ON(!d);
>          |         ^~~~~~

compiles fine on x86 :-(
