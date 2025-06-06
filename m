Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8859B1FECDD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200618; cv=none; b=KejVlaSzJCKFhPI2vznmF/VyC4QJI9gZ8mqTJdQmNPN6S6oL96Dpph/cGr/7fFkVQBIR8BbKQmiRO06jry3LHkqfDmbo2j7F5iuuCmnVcXM5/wkQ7khzjaXSma9U6E1Y9tcihlDjVfkGX5mbvbiXQlIIbL5O/m6bUqlfGwGPfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200618; c=relaxed/simple;
	bh=NixwJmhararRG0PXik0CMU+BuPMxAwgYpPtxJpeTDK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LmFigY0FKp7OnlyuZwb9hZtKjHA9MflVsD5PXZNdWEdxXj/pyemnFfoQa31rkQ2yGAVUoMo2VNU4BZES00BGJ9+/87zXo1LGEeY6Fg2jINKFuuH8z2qWCLXF5dxX3LA+qbdioSZ6PO/vfjubSV19j9UfJd7PgDE6aLhaWRhpBr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4kSnPIbi; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4kSnPIbi"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450d290d542so12172605e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749200615; x=1749805415; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXmA45OktDW/fOAesa/7QySr6oLvpP9eVh/oC+dlXDM=;
        b=4kSnPIbiJPffn1KOB2Ti5KjFYGBE0XCnO4kGkHFnsez1/N/woSKsaNFpJZInr7PPE/
         vFn9kVihU+wyGiL73DQ7vyOwNdhG+WSbX7b71EDtsQlapa6MNzWSE6HgcFhjlUloQ7iA
         nsXHSmMEifBdNb8cmUQNdLcWfVDf1pfgpRwIHmiDRrpCfNRA/aZAlnv+nprWd5f88bD7
         jIWt7lMp1GJKan/b0VIc3BQyT+hPK7nGKeIp7h9HAQ9G8cSQDTFxK5Y9vmmrTa+0cllK
         iki4aPu2YBiWUqmxsEoZBeNb5JfY74+30k9rEImh/YwxKsa0fPALbxjn99uMciI78v5I
         upqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200615; x=1749805415;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXmA45OktDW/fOAesa/7QySr6oLvpP9eVh/oC+dlXDM=;
        b=LG1dDyGuCL7aYV7ZlT0qFb6TWwfNveHEZUM/jgbeu8XTJKaBB+HYsBOjih+wt145M1
         xycr3W7vTQhamOev99uS5qrotG4Ojb72I3rltWaxYxesuJq+dll8IzD/CuKGzmKRmn96
         MWE440PLyxe/m50qKIcnStlMqydm+JQpfvE/r5NmXGyruNxpP7LLa8nTQJcEoUEk/4/F
         nAk56gqIrzfSEKuNfPV8KO/Dj9Fw9Lf2HX5kGXulEffQ2S9g2h32sW8Qh3PLVLx3g+aR
         YobVPZYPQNaMC4Eopb2kn2Ui60SDpSB8/1VgJZpahcR6tDJwFPd7qIYJXTKZzaF6AEDX
         b2mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4sigPLRIQ+mOcd/nyPHjsGuDTm5KnA/qbrEjjuwtFwBUKkWUNlz7Z92C36icjEX2pNlTs6TsDnfpaqb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV6DKyGXcxUQ5V/+TOQxejznwkIBinsoRxk2eLmIJTGXaVdIT/
	WfU+GwsMbnSVurYhWTV6aEJGIos5q62rjmqbq5cQb4onZkRw2/L6512rKBA5OugVhRKv1i6jgka
	nfjESsfnFjHKL3G+npQ==
X-Google-Smtp-Source: AGHT+IHFQ6pRF7d6Uf2Oxmr4H+s0YtMi7Jc3S14x7LDh/JCicwAfoN95lt3GaMtzT3oX1lM0zaOLBSxt36s38pU=
X-Received: from wmsd9.prod.google.com ([2002:a05:600c:3ac9:b0:451:f443:5948])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b72:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-45201450b88mr28775525e9.15.1749200614959;
 Fri, 06 Jun 2025 02:03:34 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:03:33 +0000
In-Reply-To: <20250605141930.1069438-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605141930.1069438-1-cmllamas@google.com>
Message-ID: <aEKu5Xusjkxa9vZV@google.com>
Subject: Re: [PATCH] binder: fix reversed pid/tid in log
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, kernel-team@android.com, 
	Steven Moreland <smoreland@google.com>, 
	"open list:ANDROID DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 05, 2025 at 02:19:29PM +0000, Carlos Llamas wrote:
> The "pid:tid" format is used consistently throughout the driver's logs
> with the exception of this one place where the arguments are reversed.
> Let's fix that. Also, collapse a multi-line comment into a single line.
> 
> Cc: Steven Moreland <smoreland@google.com>
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
