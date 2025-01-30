Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832A1E1C22
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252553; cv=none; b=hGqMt5EHRLKxiqKkhr6681v8nAXaYf5jNjHC7heibKFsczBsmFeGyUOb2AJljbx4o1gzBPTyxklYfdZeD3psT/4zaf3WDo4LMzisYA6hz84uPzTN5Nyyz3z2R07z9CNYZ8c6skodrdi2a+6f614EaJZBAQ2q7g8FL0pDGhu94k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252553; c=relaxed/simple;
	bh=pU1zgu3VyGVnXmoXtL1hak/fvrA33iGdz5knc0cTcm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XtA9x4wIhdjzisgmcMH/QCBj2bFxDyMpsT68DdCPmK5EV49i7DYoQ5icBqaAQwGoXI8ep71DGFvzkCXFOS90zVarc2Lh+VEFK2+4yzojv9sYYm0EYDuFvQf0Z3sOcYF7OuW9bxer4zu6t7an3OQD8XOm28HbTjAdWGSTv/NUibY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g/Jk3dOZ; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/Jk3dOZ"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678c9310afso234941cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738252550; x=1738857350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gPuxTWL11JQJhUA2jK4STSm/0jEICakOx9XSDtMUZj4=;
        b=g/Jk3dOZIVrR5eDGPiwIs7yFs8FHISJ91t+dA2X4yl88tOj8Mk66u5rXFmvKd9jb2e
         cwiSZnpRpXbxhIpfOkN8myd5A9Y4B4pw6MMOl1/XP3AzInxZMTCeCF1/Mkv/rzlE5RUv
         zZxdkHtwQMKWTxuu9PCAEsBB3wiecrC/sB8y5+VhMgBFDndU+0+m/aoK9Qrb9M8V6MRR
         4hTcs3n0TvSRzYhd1nkmg454ks0JJOxprKhA2hrwhItecqzUauPcNe0FrakgbwGqPSye
         bBHoZvkVPw29aW9o0fuX/qhxejio9aD/1t9NWiv0qYqueh48g6VA841aMTSgd8EYl5wJ
         4gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252550; x=1738857350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPuxTWL11JQJhUA2jK4STSm/0jEICakOx9XSDtMUZj4=;
        b=fl5AVE2OXDWomR0KoGuFqJCZqNvbz6/atJyX5/pS+fZocEa0csmwuwXW5ou2qkYjZt
         5g3++Yr1p0W0q8Tk3lF1k3CLoBsU1UJuIzGuhlHBUkfVtkjzOGRuW3ggJdRDsb5boaAl
         BdVaE7+XlO+dGUp9uEaTe/la/lQksI7jyfKoW0ORyMdU9OEvRGr8WGikwX/qyTq/sIlM
         DcG6YyFFrOvqFR1lTz8yFGg3bOcT6EWt8kgaQ0p8zPx6JjZHzM9yQ7T5s5w/pjksagwE
         s0nMKEFtf5mPHRfxcQ+iAAFg9yzmCdhAQEzz2/zEdi/wdfYzj/FKQ+jcl0eDikviOnYt
         pZsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeX8L+8HfV/YXxdqeHzuXR7oUqGPqEYENw2SckYASeuhTD/oH6/LOVzeCmXgw1XuWN/AJQcBrzNJQggU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSPp7RsmIwMHBC4qAqZYQ59WV2GP4ZjCxQYSZ60hz+kc2NXfF
	MttxrFOM55PsVn5wQZKkFmlYlr8vOFfPiG/XDqNNFayGZxgcsTYkskprnXAYzPJ8Oe0T3cPW3XB
	IhWta33KwQUsgKMoXV++zu2J8O7kALxRvJu8Eqr0HLfL0wniGA2O1
X-Gm-Gg: ASbGncupB3Lz9QS2vggTzZMJXVcujKEjb/jgFmruXaQQ+ldliHh0LIs85ipwlp5Prxp
	BkTYJk9ZKw7sqW0C1Q0/Y/P0BvbWr5TupFGBBUIAwOK0EqYLDXDiMz3c3jnJlNLJuBDNLKbWGF0
	MVALhqbGFIu0eBQw2MtzIQ4y2OeYU=
X-Google-Smtp-Source: AGHT+IFHB7rKsZb4QjUNCVKPKyTgN8xH7+wfdczpYVAu5y18Gnq/h8yl/V7tXr8gPVhXTYeTkntGJAzy95Kno8A3oEM=
X-Received: by 2002:a05:622a:1ba6:b0:46c:791f:bf2f with SMTP id
 d75a77b69052e-46fdf5bc2a8mr3375561cf.1.1738252550566; Thu, 30 Jan 2025
 07:55:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com> <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
In-Reply-To: <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 30 Jan 2025 16:55:39 +0100
X-Gm-Features: AWEUYZl0GF5Oi1uY8Kg0VqJNObRxnZZ82Cfhh_LmP9Ajz9yvxxXObZAjbFFBRo0
Message-ID: <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 01:14, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> Thanks!  I'm putting it through bot testing now.

Hey Josh, how has it been going - could we merge the feature?

(Or, has it already been merged in some tree that doesn't go into linux-next?)
