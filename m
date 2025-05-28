Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A31B22069A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469218; cv=none; b=fJq8ZcG6I+yQKjtxWD5KrjOMUr4h6eNDcP/7BsXVOijBzjKIjhCk49P6hQHSlgWHsETZt3TsFVUioXvtoXurxAfc6QgtJCd3oZuDvqN5RyhWZ4Portqmp9IVLJiSpzyxXbx4SY6rW/hOOth6K3Eo2qyo28rYY1q9Cco0uf1zrs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469218; c=relaxed/simple;
	bh=+2MRfNb4wrny+UCWA3gIv7T/jo5hA7R5TsxmQENnHNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYY93m6Dy/IkYHkt6xYe98XyvxQEvLS8xoufKfUDJF5tJe9fBH/+dov030HhwO2KxqIXRKYZVVzBPYex2Xx2Cw6HdbfLtf6/8YBRscu/1OjOZZxAJQ9vBez6IFBTXHyAObgHwbuaD2aaRr56rOzV0qznvGq3gMAcsaQpRRuPITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=K3g/kxqW; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="K3g/kxqW"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad883afdf0cso41918366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748469213; x=1749074013; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0jNIw+T10Py+9ZW8/brmZAdNinpUUuqhqJJHQdQjz/w=;
        b=K3g/kxqWIYkaBxDPQQ9VqG0CNsR2V64KvgwxgNKSbLoL42Jh0i8I995Kkm9N4sn4wh
         +8c+h2UHlmbgevgm9M6EpeS4YaoG1Vu+jIKscGvm/eWeDvTvWmhIzadlrP79yqSbgtms
         P2F15qMZNjINzl1b6IVRQ3rxg+KWdlgZxlQTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748469213; x=1749074013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jNIw+T10Py+9ZW8/brmZAdNinpUUuqhqJJHQdQjz/w=;
        b=rXDwJeD1K0UgrKRWK+K8z49gZXDEZJO/gX0CUtyQqVDueDmRKS5LCM4khLj7kVyMnY
         zVWWj/lTY/1LnyY+1SyCzkOmFqoE3dI82iEFO5biHv49OjUdazf3LrqKH0laX47DxJyz
         4K4AJUaXyW6cYjZ2WaTwIEJ/E3kJ8H7NZ/jL/ePb0GBKlrJSoz6iVT6jfMDklCx2Jn21
         akBUfa99C87fzoYJwetOaF0vCxWALfXOLyY23NcYMk8tqmuMm9EAFWnt+S7H6YxJJlGX
         0ZhBY+hmac+n1Gi/xs/p7aqwCWTggoXEp1DJ4WCxJTWoNp4LNM52Gtu70JsVHrtWHEqq
         TjcQ==
X-Gm-Message-State: AOJu0YyRQBe0vx/3d8zLHlnu4vXjX+GJczXZcyxDcDxffJhujCvL9B+i
	o2nAYGa0W2OJTjOSAGO73oXq16nUvZkp/VI/kcW6zGBcoS0+yYol6EVQgbeEKwef7WbHPhlS6rK
	YqrwxVUE=
X-Gm-Gg: ASbGncu5q1G4EqnDLrSsW68oZhKfJIjEH0TErgAoifTxYQwVcTlWh8J/V38EotdSkMl
	orkuXyb4QttVJkhNyYL7qepApCgLcYlxtwRqNlJyAszyCHNxanxCMBnOeUdDYn2PHdZgUBvv5xQ
	ExnPtmvhQ9+4rmlfooBuAhRHsSuOuQLGqeBtw5iJHGDEBTYJArJDOAusxu4FBCR3MfsBhMHZS9Y
	sQUarQyHZr5RtDnkxdf37/HD063gr5SiQgyHS1z9xgbslngwNifFsgfpJGgB+0fu/nuklFttCVI
	UnKFn70aUZJ1mV/XaAqKlLCptLLEZ22yL5qcYRsOtNaZGCuPQxQpkBR7YeqIydkTa3n+rYNBuiv
	2Z+9dMdilzQ3MYCtYNBfxbjYrAg==
X-Google-Smtp-Source: AGHT+IFkixFFLjErs01Ceq+ZvdkdDc8HxeNEa991SMjcOgBL/T3oGyTWqIbtVmNiJvc1Ktdt0nmz2w==
X-Received: by 2002:a17:907:da3:b0:ad8:9b5d:2c26 with SMTP id a640c23a62f3a-ad89b5d2e87mr512153766b.30.1748469212984;
        Wed, 28 May 2025 14:53:32 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fee08sm8929466b.8.2025.05.28.14.53.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 14:53:32 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6045b95d1feso580262a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:53:32 -0700 (PDT)
X-Received: by 2002:a17:906:dc8a:b0:ad2:2fdd:fef2 with SMTP id
 a640c23a62f3a-ad85b27959amr1688689666b.53.1748469212110; Wed, 28 May 2025
 14:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528110024.19319-1-dinguyen@kernel.org>
In-Reply-To: <20250528110024.19319-1-dinguyen@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 May 2025 14:53:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgarGCfT-5TbfWf-BHd0XGhguqp4tWjj13Jo0rEDFFu9w@mail.gmail.com>
X-Gm-Features: AX0GCFsuf8L3INSHVHCLduEiRonYs-0WCtSjhkF2Gve7A0rAnAxyYfwWbIonwBA
Message-ID: <CAHk-=wgarGCfT-5TbfWf-BHd0XGhguqp4tWjj13Jo0rEDFFu9w@mail.gmail.com>
Subject: Re: [GIT PULL] nios2: updates for v6.16
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 04:00, Dinh Nguyen <dinguyen@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git nios2_for_v6.16

That's not a signed tag.

I do see the tag nios2_updates_for_v6.16, which is apparently what you
_meant_ to ask me to pull..

               Linus
