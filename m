Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2AC26461E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739231577; cv=none; b=ZbDC8G9r/7q8IFivXlErkaUxJ5pJ0gvtblvFRqJLEU/iNKD/N3yPdI6mvCThmcU4o21aypIkufvhAI0mFCAZpswLEh/Ln2dvg8Tv5P3nqGCFfJBK4ERzGBEABvmLmIgy0zG8QkJFT0noMMpgj6uCDxJw2V3lYid3JrwU/P71ojQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739231577; c=relaxed/simple;
	bh=fkrFa/sjP83o5njakBmSzfE8Vd4v+jF8u18NfOvjNrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gwc+dZwzMzkmCB5L5dhfHMROvPcEhkVnfJIxwcDDdtbOemoFJbyekPb081wtwkWlAkUAqe3c99i5XyZHXzt8lE2AWKojsKwTnCwfan4b6FYq/FghshcVCIbN5vLA2myRgAj1bYYeNQQ5qFZQWMtsC58hBlf3jAh9a+1rqsWdG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWqTTgQ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWqTTgQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137ECC4CED1;
	Mon, 10 Feb 2025 23:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739231576;
	bh=fkrFa/sjP83o5njakBmSzfE8Vd4v+jF8u18NfOvjNrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWqTTgQ4E9saGQCLMiSlPQQa3QExIwNAUdI36pniJ6D2Yo3J989TQinviI+KwylCX
	 qQ5WPsRZS9bG81H12ftB8jgX6GDXcwnAkknW9S8uXYXbpDFSwP/nfkv5svkV9mfNMN
	 sqPcjnPjOEZhY/WAgmJlcWG5H8spfAGLAe8OQqzxewhLf3QxD3USuc5G828Iy0zdOZ
	 Y/Jf3CVEWe4fEa3Klcltde3jf5zdrJ/7Ftng95c7ID8mR4P9WkdKMMygEf7aEnYhB7
	 efHXuVFggwn9UtdrlXJ6yazmqQihmC0TYsPLYU5vqKeKiSsIU0wjpKiL4l14bT9x1e
	 HyAAgIw72Rimg==
Date: Mon, 10 Feb 2025 15:52:54 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/35] x86/bugs: Restructure gds mitigation
Message-ID: <20250210235254.s66vwnh5fvxhvjej@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-11-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-11-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:50PM -0600, David Kaplan wrote:
> @@ -902,7 +909,7 @@ static void __init gds_select_mitigation(void)
>  		} else {
>  			gds_mitigation = GDS_MITIGATION_UCODE_NEEDED;
>  		}
> -		goto out;
> +		return;

So right above this it clears X86_FEATURE_AVX, should that not be
deferred until gds_apply_mitigation()?

-- 
Josh
