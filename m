Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3615333F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473936; cv=none; b=F9Sj8kX/xiVJObeRoiUzocWVkTjdWQi+ztzDQGmfDtUE2jsRDKX4wdJuV4YcjkJFrG0NzW2nPmyWnKN/TskiudOJk80R6uBLuxFOiuRlUWfwrNVqUMr0x3/dI3x0DpRLXDOrn6F6nJEPXLe3l2827wpRrCaYGSCjXIQ/0t8N2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473936; c=relaxed/simple;
	bh=08DDf+lpo5A+QWtmzj8oryU0BhvbWGyl+PK9CDVK3Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pleOeCC2iFO2KN5929JbEksY7Psc6jVjAQW/uhYQ/6gKz9ow6hrJXuwO+XJxo92haMepSpvz4G2zyOfw0X9tRm/VhefzAUfYKwVr0eEaSPBu86Er1idAe21EI30ZS9NzwH4yftWGZmHEIqKGCQmjN1SFoK6q7msH6189js9CMGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4AK5Kx4x; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4AK5Kx4x"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240aad70f2so104005ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743473934; x=1744078734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s95Y5urhqqftOUwoq+cKJUUXbKxTr37Y7O/Shs5OFC4=;
        b=4AK5Kx4xnzk2GAsfm3sfWT7Tfa0Ey7qBC+2rEFnwb8GOJr7FaK0h+g3AElCEcExN+q
         d5ro16WYvBji6zTCGDvoLkI8Krd9MU/0d/Wcww15twqP4SjzyglDRCnMgNN7PqNroZqy
         vMUoJSkHRf27pTvk7h9onkjbsipe3pni7SaF8dr7i10YeREaEap7n9cS0D29/a5GWSvb
         ojEvo72LvxvbF6f/mMW1NfQgfbaUJ2RfcoxhcgBny0uiRLkSPMt5vu/CNy5S0jpAG9sH
         Zb9TNE7VMMJTKSh+lKrFstv+LuqpwtLfhQZcQZzxZp9ccKjESeqG/beJAKh21M6uAsil
         5Cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743473934; x=1744078734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s95Y5urhqqftOUwoq+cKJUUXbKxTr37Y7O/Shs5OFC4=;
        b=UvI/1HX4zjm8XAfI9dM5QUDBJsAS9AkBQoyktcOAlEhfVFidQEpLDohQdYzec3ts8I
         0fCI9CzESrsCrkMaG/73pJrO1L+HZWx52TA/PrMJ4dmPV7q1qu7M4W678Om8OTL/I3n1
         THSl5JyWdH6foOCmYTDJi+lC81SmDaTle+Oted8EG3ZfjKIEI50MVyBKdumKNW4Y4ZWN
         i39WABX2B0/cUDJu01w/FiwTw9Xju70U0AxJo5TamPVeUETTqS/l1raTdkFkjfCIZJEY
         3lkTwggf4Jr8svFJRBpfU50hs953BNIa1YdcRPMH3YJQ38po6wQS6h9gjgrTZVF5pCW3
         Vs5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHeXgkVghLU4vXaJHRblnIPogWWKVfrHIFBz09wf9hqmkgaGWBy1bSFMZEzl2SkqfOFjqroqzEO2xHDBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfbuduwJBpbiQBvetrYAQe0wAUreCnoXIzGxr0o1tHt74Hpxho
	B6Mz3+gsEp5mxWhgusX24I+g25+w7gBYliZsjtRpUWuC7AGDIZeTa3INQsdpdw==
X-Gm-Gg: ASbGncvi8H7lW+PyrJzeMPS8Ri6pPpQAeyijXza0RYgQaH7OEuMkj7n9ZBneg9/ZLZj
	OQYc6hGn6n3d0KwTmTdEalFm3JKSoNH4yg3f9KzgqaqyRZUuRfCtxD28slRlXC1JrnEd74BZs5I
	wT4K92mz5GVG3EfTQc1UYveqKc1+U1ubj94Bgew1pVKoiPqsUgp+TeDfSYzWzy4ecjEDeay0pUT
	1N5RJXsefQdfhFByVW7BhG1eAYoA3E0CsV1WY9YSBLlOYv9gjsSlrnOvu/BgAtMiuAZ5u4JU/Cw
	1SbqGpQ1gNVhztrmxfz9HkRzJYq00Nj+7zTLdtOOmaIjV9zB5FZ6zOSZXBGH2xUezxpnjgNJxaL
	UcRhE
X-Google-Smtp-Source: AGHT+IFMUM9bVqtqmPRR2f2XEjwOx0sERGFkmgafdlKLdgSXdMYpcfms3xsYXaMHH4aja2mHMecuXQ==
X-Received: by 2002:a17:903:2307:b0:21f:465d:c588 with SMTP id d9443c01a7336-2295b001616mr1925175ad.14.1743473934086;
        Mon, 31 Mar 2025 19:18:54 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deebc9sm7953751b3a.12.2025.03.31.19.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 19:18:53 -0700 (PDT)
Date: Tue, 1 Apr 2025 02:18:49 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3] binder: use buffer offsets in debug logs
Message-ID: <Z-tNCasDwqtVZQOJ@google.com>
References: <20250327231722.3204898-2-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327231722.3204898-2-ynaffit@google.com>

On Thu, Mar 27, 2025 at 11:17:09PM +0000, Tiffany Y. Yang wrote:
> Identify buffer addresses using vma offsets instead of full user
> addresses in debug logs or drop them if they are not useful.
> 
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
> ---

This looks good but there is one problem...

> @@ -4223,20 +4219,21 @@ static int binder_thread_write(struct binder_proc *proc,
>  			if (IS_ERR_OR_NULL(buffer)) {
>  				if (PTR_ERR(buffer) == -EPERM) {
>  					binder_user_error(
> -						"%d:%d BC_FREE_BUFFER u%016llx matched unreturned or currently freeing buffer\n",
> +						"%d:%d BC_FREE_BUFFER matched unreturned or currently freeing buffer at offset %lx\n",
>  						proc->pid, thread->pid,
> -						(u64)data_ptr);
> +						(unsigned long)data_ptr - proc->alloc.buffer);

The alloc.buffer should be alloc.vm_start, this was recently renamed. I
think you would need to rebase your tree.

--
Carlos Llamas
