Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52172BAF9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051233; cv=none; b=kBdmtixz/XB5eZCiBS5hjcBYXOrRNeYD+qFtPvQrDgCUiKeooKpefgUR40kQGQxsiGQ3twqHRv3asAk8w2BXKbICCugQoxpSFmGByx3BsMEBVLa6Va89jSNlcPq9xVidhqVndJibc1FZO43o4DfZJ6Iopl24JZSKLbGcZ/N+/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051233; c=relaxed/simple;
	bh=gRH6bQJVT0kWutn4D4yI8XEfW7RwsqVgI38t7XVn1BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+DEP+lFr/ZQI3i8TplAoaQ5ZAsx9pWYwM+RqraCWqJJQWtMZ1aTcIad0678YHg1xeGzG9x9eiVaL0y/LVwhfm0i9RqxOCeIHs/ZC+urOFeGmWugJd/931rcIQVN096JFOelXG+C3dN6SSi/qr9gf313WLJ2YPE9C71QeqEHmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ARXunImr; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ARXunImr"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2edec6c5511so737799fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751051231; x=1751656031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CxznrGwJamZIk/DsTZnWe894P2DXZ821s6aOSzXYpyI=;
        b=ARXunImrDBslJLJLpsXx8ZlMAA1mbLPIdrdi9JJ5DgmhyPw4PghQSBL/swDFOZaUiJ
         TIu4XN4rGaGNU08uesxaPE9l33OlZrmCJlXa2fqWt22Ff7HlamgWXYBuncPMR5IWGquO
         Wo9xfD+E9m0WRfXN1bIwaIiLiz0OUXCo0WhgZ7zoIuT4WlwfnAunQIMdmzSnWY60BcYO
         tuJjZevfI5lyCYMGnx3QC2JJY8PKc7RHGow4Vcw7A/LioGLYBGVfAMethm4Ync/pAsNb
         16W4irAUkTleQ+zer8RsYcc7QIZeBafhXlNImfG/btiByo5vFWaKMq6pkozUWmQpIjMc
         JzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751051231; x=1751656031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxznrGwJamZIk/DsTZnWe894P2DXZ821s6aOSzXYpyI=;
        b=qOXZiLFYmOIJfLbpP/hQtdCkWbn6vKGRG4s9SXjj5ER9R2SHwBIimNikmFscTnV3X9
         4qfAetxCKg+FJacVMxGFZ5PbCAxDYY1yIqnt6BOJliuv+P0yjtGFFryjz9ffSPAVjufd
         euziihfbcZarzJGETKVell6WmuFBJmL/98yzY+Cj9sSOn+FetzrGGng4tf679e9VjoDC
         JicYHHm8/uFCiE3C2Y9gX5ORRcE5eqwJJ9sAawEzmWH2zKTKQ8r8CA7AZ1CrjEjlx5yo
         DLrEvBNs5C/C3wiZgYcTWOgnOLUkhgCZ/VX6QGflcE7Gid9EvdHAjwKeM46lJSUeyazg
         XX2w==
X-Gm-Message-State: AOJu0YwyPC+iZWg5B/SjFNuuc45ym7+CVjpCSNUucbNZhlBRTZj5Fb5X
	+HKOyGpOnBHJaAqpR0ya/uO2A3MjuCPWzDBIYCGoVRNUhMkLyCZ4EC9OT6D/taOO8VCHpO7+rk0
	rNcEmvaI=
X-Gm-Gg: ASbGncsXIkcJPORpaIrrXV5GtPVLg+oa5t/doT5gvYXiaadz5SFlcilv+/dTaxUHCG4
	pDX04eolYTJ1z/mytbW20akMVYwKafIgok27wnSmmjk+U2yimyQwqwsxPIW7V1AstQMZqqy2uBQ
	9auBxWOqqHiCpN9CtC9CUcP3yXT8ZDmXdN9Y0ziEOZAZEOIt2Vv4lgFnLWHyjkP+rFninM6irUg
	A7jhvmu/EOht7D90ik4GN/cqmSsOuKjvkbXmNwIIqFXm5Znc0vboHVn3HLz+CPtrnoT87/ttCX6
	aEs9y2dDnhOm5X2557il1UyhjOfRthOkKLVcIKpwFlI1EMMraFxY/I037qnEKCyISkYmHA==
X-Google-Smtp-Source: AGHT+IGVfNhZXgro3rkdSUBFgHThBES7U4lixDdALrjoSVzcMwU+UcYWarThB3QxJ68AA67x/PKgcg==
X-Received: by 2002:a05:6870:a546:b0:2ea:7963:534e with SMTP id 586e51a60fabf-2efed4a421cmr3358354fac.14.1751051230783;
        Fri, 27 Jun 2025 12:07:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:e9c1:9891:4bfd:dadf])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50b20eesm1000616fac.27.2025.06.27.12.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:07:10 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:07:07 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/9] Doing it for the consistency in the tree,eliminating
 the full path to the script
Message-ID: <be91d221-0182-44bf-8d70-131ed347b738@sabinyo.mountain>
References: <cover.1750459100.git.unixbhaskar@gmail.com>
 <4ac24fc6d88cc4cc11ac6a4590562d23882deba6.1750459100.git.unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ac24fc6d88cc4cc11ac6a4590562d23882deba6.1750459100.git.unixbhaskar@gmail.com>

On Sat, Jun 21, 2025 at 04:08:53AM +0530, Bhaskar Chowdhury wrote:
> Just try to making things consistent across the tree by eliminating full path
> to the script.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  smatch_scripts/find_null_params.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/smatch_scripts/find_null_params.sh b/smatch_scripts/find_null_params.sh
> index 9e39146d2d40..a78eb7623fb4 100755
> --- a/smatch_scripts/find_null_params.sh
> +++ b/smatch_scripts/find_null_params.sh
> @@ -3,7 +3,7 @@
>  file=$1
> 
>  if [[ "$file" = "" ]] ; then
> -    echo "Usage:  $0 <file with smatch messages>"
> +	echo "Usage:  $(basename $0) <file with smatch messages>"

I don't love tab indents for bash scripts.  I know that the kernel does
this for scripts but I don't love it there either.  So I've been hand
editing these patches.  It's easy for me to hand edit these in my email
client so no worries.

>      exit 1
>  fi
> 
> @@ -13,7 +13,7 @@ cat null_calls.txt unchecked | sort | uniq -d > null_params.txt
>  IFS="
>  "
>  for i in $(cat null_params.txt) ; do
> -	grep "$i" $file | grep -w undefined
> +	grep "$i" $file | grep -w undefined

In this case I think you were removing a space from the end of the line
but somehow your email client seems to have deleted it so the patch
didn't apply.  I did this manually as well, but you may want to fix that.

Anyway, all of these are applied now.

regards,
dan carpenter

