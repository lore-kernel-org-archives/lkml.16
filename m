Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C124E014;
	Thu,  3 Apr 2025 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683018; cv=none; b=fwUQHytgKOZpaVdqfYp0xOOWhZnn7OmWzai60bbXDBCnH2Hbv+b9cLGQf95aKKQhk/w5fcWkuCsy/984MlbdLYdNRU5fiwyymHkDhi/qaaNcH/KZkC6C031VFYDMLna3VATXEqLDW/WJSwDiLK22LQW3TKpq5OBiJSXWeDSzMb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683018; c=relaxed/simple;
	bh=mV8Ud0kJ2HOcDRD+EawTqbxYtkA9rGBQjal3j1wgR7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXJ2JD5LCZORJ8npvmy+vP3lnJXQbm7GLb+UTZOFIlu+zSimPo3yfkA7BiEO/KT5+b7p1uG6O/AhRnalZxW7Y2QdzHTK4B1kieu3anD+BjUS3LKvmfWF7HkAksKHZGw2FdwvO+7zmotffCfR1GBKVjk31f94JPXrkwSs/O4FZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=QjCf5ba7; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="QjCf5ba7"
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1743683003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DW8+4tYgpDV/jZof7i38WApYtRbstneT3NA1iPEkeuU=;
	b=QjCf5ba7l4mKmAErAw5kUkIDL3cldLGjwUzNNOQLCclZZVnX5ZIKWNnXYI2mXQigKZ84En
	V4nOP9v1C9MBfn0yQlPhUpaAVKJYJVupjRtD558iG4Vt4KT/VKAT4jWZloB2jl5rcY+WxY
	3T7POmHraE+hqDcKOOThej4y53hTc54=
To: ilpo.jarvinen@linux.intel.com
Cc: arefev@swemel.ru,
	corentin.chary@gmail.com,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	lvc-project@linuxtesting.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] asus-laptop: Fix an uninitialized variable
Date: Thu,  3 Apr 2025 15:23:23 +0300
Message-ID: <20250403122323.18129-1-arefev@swemel.ru>
In-Reply-To: <ddd60b0f-47a5-c93b-f055-d6900dfbd7de@linux.intel.com>
References: <ddd60b0f-47a5-c93b-f055-d6900dfbd7de@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> But if ACPI doesn't provide a value, why should that clamp value be used 
> instead? I'd tend to think curr would be more suitable "default".
> But shouldn't the loop either use continue to retry or the function 
> return curr right away if acpi_evaluate_integer() returns an error?

Hi Ilpo.

I'm sorry it took me so long to respond.

Yes, your comments are correct.
I hope the new patch will help to make the algorithm less noisy.

Regards Denis.

