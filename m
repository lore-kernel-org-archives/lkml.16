Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8DC234970
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795204; cv=none; b=CYkZeMqkhHP8EiRez6QygzPfAqVHh4T8+jOhhxiA1jzAR3yEM24lfvQjTNUOvetCZ19zr5ICYpDZzyvudWqtODBI1eL+pigfFUTavc8dfQzCQsUDrDDUSsokqoGodBgFk8R68ozb6XphrPw9CS5hojZwkRiLLEmLi7FRD4PP7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795204; c=relaxed/simple;
	bh=PJUUGXu46uBDP8rjQ913DH6BpKRAMBf3Uv9RK88aGcc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jl7nNPSbbpK6kJ8CJw07t2mPWwEvUkRk0KXsotGCLV1J889tV8jSDzg0CH9OfjHrW41EjLktd49xQPznilsFLG9kanlrLvAOoUhnk7B3m0C2kUfVqXyXBCeY9cQ98PK+ShkfBFsYLhzRwhqGTXkMVcZA5G5PJUuGaOena371eP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KyVwxYJT; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KyVwxYJT"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so2993676f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744795201; x=1745400001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6f5MZAw1/8ngcM2a1DcYBbxnahqNumXsS5jMYCIAoQ=;
        b=KyVwxYJTTYSHX0u4LFA355aETNleCUvrSmPrMG3FRdFfCkOB68VtlKrO46rIonV5Q7
         jsT07n6URl19y2gnyjIcS68THZRCUM9VPv0ILi4CuvWUKQoHvIGx29T0BnFPC+mcsBGd
         DfnEvwYun/a6tj8BtNfYOBk4Fghkgihc/kITF5Ts8X+AvmMP6M8W2Do0ZaFW7lDeM+M8
         Fnu0qWN780DPhMwsy3gx9rk6uv7mjQvgo9kqkcp5y0lJo6joUhBA+++EDXx0oAbl5wfW
         tZyp+Gd46hzrnS2aV+bMg9C1gwNs7uGiwJ5+59WDFOxezRYegKr4e2oZDMa4wg31y6ab
         Y2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795201; x=1745400001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6f5MZAw1/8ngcM2a1DcYBbxnahqNumXsS5jMYCIAoQ=;
        b=Zm/PB91VuDlqUjbiJ0q43HLnuY4eKl7Yzl+SEUuAo1HNbiElNlA6WEtjTS2mS1iyK5
         l03OidT1TvAYCjFFt61zwKDUN9uQhVO30ppi5e2WZAKUubYY3+oaALyPtC7vXtx7SvnD
         G7+G83DH9KDB9vZSsVPNYyNfi9CmK2QSzMZwY4mU8c16LSW4v0IBct8RCFJ/E7KMFLgn
         CNBN0dYnIdEVe+8ddUOhqgsMNYm2N5S5dPfB8vstHMm+zU3zrsZwDPWmwq2sf5DTw2/G
         2ZzTZe2N0HY0L7sTAwlbua/by0dM8eOG+SDw11qCHUTqAjUlKrz/9Bn2VEviAQvsdcZu
         Tb9g==
X-Forwarded-Encrypted: i=1; AJvYcCXe0xTHQMBDJHt6hrpqQQTsAQOCr+pnXzRu1yBdeKy9sVEr2H494PbMlEu7Rb2e/c6CZd6ztVuxqCdZp7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGdVd1RBdHQCmil6/IqOeeam3UbIMpCZ1Uy0meAMBOQHPQ9j2x
	4gQUQQJae0tHqMifHDTdYf+dVwccDtX5HXZ5naDDkxpupYouEczxfwodptpGIYnfcUvdam2yImu
	xwn7WWPGDzHYlTQ==
X-Google-Smtp-Source: AGHT+IE+LPlYtROtdkaSzXp5O419764ir50b5yJYKU2zOk8Q5Fijtc0MINN8HN0RAjAbo0ArSS1WfXsQC4mSIk0=
X-Received: from wmgg14.prod.google.com ([2002:a05:600d:e:b0:43d:8f:dd29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:240a:b0:391:2b11:657 with SMTP id ffacd0b85a97d-39ee5bac498mr1149784f8f.38.1744795200928;
 Wed, 16 Apr 2025 02:20:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:19:58 +0000
In-Reply-To: <20250401202846.3510162-2-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401202846.3510162-2-ynaffit@google.com>
Message-ID: <Z_92PiKOTFtBi4qB@google.com>
Subject: Re: [PATCH v4] binder: use buffer offsets in debug logs
From: Alice Ryhl <aliceryhl@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 01, 2025 at 08:28:46PM +0000, Tiffany Y. Yang wrote:
> Identify buffer addresses using vma offsets instead of full user
> addresses in debug logs or drop them if they are not useful.
> 
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
