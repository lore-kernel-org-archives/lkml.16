Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E2F26A0EA
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750533174; cv=none; b=CGwHh1ZI+zP9Q/fVPkLuji2HxdU95G32wXOKUZx28GwnCMUX4X4ZAr5U5Mj+j+lFBgx7Zbwm49Ekl8TaWxmICjqgK3WtZWIH5MoaMDzgYnA2I568lZujR5jIoH10EVF1CDpEXthcdvL5qZbiUlUXKRzRlYF3rYXlH/yZt0O6KL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750533174; c=relaxed/simple;
	bh=3DgPE0stiAgy6zwxgjL4iwaZWfm9/g/fP6vmY1+Sulc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oi+0HsWRADBSLSa+uxrlcrChmgAJb4f719yguX512Tqq6PyKSU8fVqR4e2Nj2QNtldIYBP5qiXnbmnZ7H7ykPVEOhcCcK9vGJBsHUozPkOJQFRs9Zli4jRpLhPwl+kaaoJWogeVxO5z39cLYD8fMI5Uvwe4epplrcubn/Iq8jzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id b409b2db-4ed3-11f0-9764-005056bdd08f;
	Sat, 21 Jun 2025 22:12:41 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 21 Jun 2025 22:12:41 +0300
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 2/2] gpio: make gpiod_is_equal() arguments stricter
Message-ID: <aFcEKWZvRKQRA6dl@surfacebook.localdomain>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
 <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-2-a75060505d2c@linaro.org>

Fri, Jun 20, 2025 at 02:58:02PM +0200, Bartosz Golaszewski kirjoitti:
> 
> It makes no sense for a GPIO descriptor comparator to return true when
> the arguments passed to it are NULL or IS_ERR(). Let's validate both and
> return false unless both are valid GPIO descriptors.

Acked-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


