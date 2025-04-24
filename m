Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB79A2701B2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495184; cv=none; b=IbhmupyeeySmf4IN2gpZBSju5zqGm7Gup88uQZohiCa5LIicHazbX/VAb7UTcsV703I5zYHlZGzhmxrjmB7nhooErBMKggs4FMkmmX7vZ6SMDeuUyeaDxrTUaKl1/PVsDsR6MBb2hCztqDbXOpVs6B6J0qG2Xn6GzZ57uneaWj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495184; c=relaxed/simple;
	bh=tKqVlHmpfXGvqxbTPuKG2EQSAwPdMyT6wVMimvYvW9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hdJJeB1Al5yyqABsl0piW3vsrcLqfwiC3JOh0kgvS3qB0HSAp9pLTOFvB2l6N5gaab7K34vXD9lRnSIvmUkppePV+s4guETnj2klCLtIYuRARUP/2st0JuYCjzE12wht0ZPbUJEyTYXnk/Ms63zzDNLgo2FOBtfKhHU7kbyF+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NFm07lVN; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NFm07lVN"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-391492acb59so432788f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495181; x=1746099981; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pv3qTtqvksyrvZvDhY9gIkkVdBN4Bt/kZWJLa3Dx0M0=;
        b=NFm07lVNYCgUCR/72s02TO+ipBS7gcN03UCQ45Q3vqTq92+0gUdMq7c4rUO890Mmbr
         L2PDa2ZTUoFR3fQQgKRKOWaGSL7lBaGxlVSvVcfU0WsFOYjpEQp2QPZmLn682iQAFgu2
         LopYiQYbII9yKl4DnAkzH7h5AIkeeOecrj9yYq8obV9NF6z2o/TH7uKEAThcmsYtKiy/
         Puu534c8CK22SILDL+JDtUa3JUomqcr5Vl8awELShKFOLlrKSTT0Pb15KuZueUd+Fro2
         EdcoHcjT5Fiw2fUqvucql2G7KIZSnTl5BGvv0QfWV2uWaSynCIgqeWB7eLhgBb+VZL4i
         RrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495181; x=1746099981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pv3qTtqvksyrvZvDhY9gIkkVdBN4Bt/kZWJLa3Dx0M0=;
        b=Smx//VDLvFq69PEaWGlPywRItPi1VtYG93SfTEeASkdo94SfXs0uWJ9+fu5gAKX/Oz
         585WaqixH0FbRrPXHUd4huq67IIgYotZTgtWLEi6UrSwB0h60Kl2Th5ytOBqBvSRkdj8
         lXMRuDdxK8rFmueO/l8XGIJ3hKSMzbLh+ipMvcP7GxO6OVrnf5IaL92+e6GwYA5BVjQz
         BkOWeWVqya28gwKcU0hXtJwI/g+L76v8pLmmDQ3pQriTW2sNIvn4CqA8BpjiIb4BRg3s
         8TbnCHbGU2iYsAxv/B2nnuMpEJjSI18hamOCctBe0UMCAFuAbAWZ9zx0scI2oOmDHzmx
         +zlA==
X-Forwarded-Encrypted: i=1; AJvYcCUu8XelMIL+VWnb3BFtIn3457zvgo1c2JR0i7s0V/w0LSG4Eqz3S4OeMZGeaAnTcmKawxXkStQXR0GQsSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqy44IYFWe1PaVoKZacuM2V8aKn6fs2vEqJifOKrsqTEUvNOrC
	fbCblOl2MDzBdu0qsomCUtqtAaLuDuqvQLrDY4LfyxWXCtZoSduJbo6smDrPkQcOYxY8oLl4aAD
	QuwE3zXXyHfyrYg==
X-Google-Smtp-Source: AGHT+IEYYz0+FRELarcqfnvIPpsiCWUeTdBrsBlupLd2xdONltEuQe0B3Z6DNSOQsFEQyXE6MMBDv4/Sy6DgyNo=
X-Received: from wrbfu20.prod.google.com ([2002:a05:6000:25f4:b0:38f:40d1:831b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47ab:0:b0:39c:1257:ccae with SMTP id ffacd0b85a97d-3a06cfabb6dmr2040072f8f.57.1745495181128;
 Thu, 24 Apr 2025 04:46:21 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:46:19 +0000
In-Reply-To: <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
 <20250422-vec-methods-v3-5-deff5eea568a@google.com> <5fb8bfb7-961a-442a-b091-0349c8aa5ddc@kernel.org>
Message-ID: <aAokixHVo5YjazmL@google.com>
Subject: Re: [PATCH v3 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 02:14:11PM +0200, Danilo Krummrich wrote:
> On 4/22/25 11:52 AM, Alice Ryhl wrote:
> > Unfortunately this can't be a kunit test because it uses the upstream
> > Rust implementation of Vec::retain as a comparison, which we can't call
> > from a kunit test.
> 
> Would it work from the rusttest target? We can use our kernel Vec type from
> there, but I don't remember if we still can use std Vec from there.

My guess is no, but I don't know for sure.

Alice
