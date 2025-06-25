Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD9B255E23
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875480; cv=none; b=Ep1oBXmKMrd8K8AjsVoHp4uL4KnHrjh5YDgW7MnV2zEcJtN7OTPNfXZovWlpzSiNV/H+fBnVHHzVkFNpnQYBngXVgWxY1JaNYy5MdgzFUMoJRsVrwFWEZvcq8hCdExprkrgCFLwULS02ewYTD6Zoahg7qO5C4VgpvOPL+jDvGZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875480; c=relaxed/simple;
	bh=6Qwu/nVZOz2dOg23pv0KLqGgQ36+8Dm7mrapeYdWAnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7JeDI9vJXqjjDffWqajzl2yOuB0bZCCcIcLzk0byENYKalilbceIvA4/OUO5r4v+Z7uPANRFm/J9wPDXPf3Lh03cA6T+m0meXTP29YVQ76d7m4aI670QuGvdUjc3Oy67AjxfaWEjQhLZEvLa9smAE60agaZG7JOXho22C0m5OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PCdsJ9/+; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PCdsJ9/+"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso240566a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750875476; x=1751480276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qDMCLl0gLWhxFwrrJQTHLjaJpteqSIGZmL7tjKy8UQ0=;
        b=PCdsJ9/+u2dDnlObDjIqxrmetkx9DKmQaMIztiQ0dJau/J5rgo+eKhLVk/a7E50RU2
         zAUXyfcWlyJnABqKVBxA9bbUdsxAfCw8PhVZO/GRn2MLRqiuO9aQ/iPzxxv6o1gaUjWI
         N4Oq924awLjybTZ6WakzMGewBIcG7U17xmkIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875476; x=1751480276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDMCLl0gLWhxFwrrJQTHLjaJpteqSIGZmL7tjKy8UQ0=;
        b=l44V30jO0FGpG9jVsi0TvfO7uAL6xXixqeB0m+gGQno6o4/qpxQQc6VXZgKPCcujM0
         Vb1PNsk814rrYyvQUenOcXvuXpGJ4xsIT8hwXl52Dys1ejHz0UvOJRgmNhMzoUPRhDSp
         FogZh8jXGKDuafIxaCJnoirx9yl/+G77/Y8Lg8dhVbdQDGElNnATHddLYWose0ZfVlBk
         Esyo1ElyXVMD604M5f9fDUEMygJMJXipQYnRLnG7EAPWnVecKQ8ls5buHTCQXFt2bVBW
         KIyBukvUqWroAvoJRDuHBxEtAIFCwB9dnRyBkWvsBIO52T+MV2m5IItZKavPnYxjh2Cg
         iazg==
X-Gm-Message-State: AOJu0Yy5ugTXhpxkuXKinFqgBnxmbBKOpNGPmnq1+xABL6o5dks/ptqY
	vO/M+aEQfJxcjScej1LdgwY09MFArCqCYf8AlaRzdyjW183rZBNE/A5R5afq5KM+Jm5IoLpTOkY
	UAqpC518=
X-Gm-Gg: ASbGncuT9C0rKYNq2MdBefQkhXNk+bBplpxsY0qHKK0gsDs+QFuoZ7YX2mdkcRzo4PC
	DHoSu7YKQ7cbKv1LoxEV3iNMr1Grc1Ajt1IGjBmm/BA7e/Z9Xs1FeF/ZtnQ8xCKeDbMCKST/CIa
	l3bywYPD1peCqF8e9xQPbWZhpdt1bn+xufCyKvZBp8AaOZeSO2RGyPYTkpRfxJjg2W9aTzr6MRO
	DNmiGW5vD2soDXknTmd4rriAhHzJavBhJSHOVAWWXAV9zrN/peKAFBPdpMSw1Dakqzoa3m+c1Gu
	bk9dj3TOSGDCd+jh2wf8ye1Ce6cU+k/WnW6muPIwqDaq7qswUEdJTOcnIdAiuerbD1ijtc1iokR
	2ogWMHyTm8L22kD9FG+2OeKpwGFo4s+qt0MxC
X-Google-Smtp-Source: AGHT+IH2TTjUab9HFq3MbAeer9tGsE3C8DCjEHQxv3FvLka7RECUra1LK1SnT79+7dR/rJkmdC7zeg==
X-Received: by 2002:a50:8d08:0:b0:605:2990:a9e7 with SMTP id 4fb4d7f45d1cf-60c4db9e762mr2726219a12.13.1750875476249;
        Wed, 25 Jun 2025 11:17:56 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1b1ffbsm2747141a12.19.2025.06.25.11.17.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 11:17:55 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so249866a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:17:54 -0700 (PDT)
X-Received: by 2002:a05:6402:4314:b0:60c:4521:aa84 with SMTP id
 4fb4d7f45d1cf-60c4dbfc190mr3579986a12.15.1750875474433; Wed, 25 Jun 2025
 11:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625121529.42911-3-johannes@sipsolutions.net>
In-Reply-To: <20250625121529.42911-3-johannes@sipsolutions.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Jun 2025 11:17:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTCAzaw4AXXpxcYc7v7ZjAeyaOOJw7FWXO+gV7v7Cp0g@mail.gmail.com>
X-Gm-Features: Ac12FXymQLV1Fu6a7N97vaofr_LpXmriw35bRKrjBjLtee6ZA9OazdfT-VQM8WI
Message-ID: <CAHk-=wjTCAzaw4AXXpxcYc7v7ZjAeyaOOJw7FWXO+gV7v7Cp0g@mail.gmail.com>
Subject: Re: [GIT PULL] uml-for-6.16-rc4
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 05:15, Johannes Berg <johannes@sipsolutions.net> wrote:
>
>  - reduce stack use with clang 19

Interesting. The patch looks fine, I'm wondering if people made a
clang bug report about this behavior with structure assignments?

Even if most other projects likely don't have issues with stack size,
it looks very non-optimal from a performance standpoint too to create
a pointless temporary copy on the stack.

I assume - but didn't check - that gcc didn't do the same stupid thing
for that code?

          Linus
