Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B6D1F460B;
	Mon, 10 Feb 2025 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205144; cv=none; b=jCN1LBEgbiCPxj04j/SSCzWM7aWGzY22v/OhkzpF4TTUvp+EWVtXbMlrLDjze8NMJP+1ZS9/d4kRSF+T23wdzlJGl9U4JGbD1I1Xf+PpAm5TER/EB9DPFYoMFkWimbuHjaVVw0XG/4+yr9dxQ5I5Y7ex1UJr2NNfSmcWURdny/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205144; c=relaxed/simple;
	bh=dpJS2WGDeq3KaUTfQSdc0mkNgb7ljggl5oUMqVH9b+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k310YKm31D0x0bdXZdrGN6YIIlOyjzuXBDr3+ralMYF8Tef5IWCtj4TJjc5VgeE7AOfoVPTesgx355Mp+Htk1En3AwLFhodFSdTdCgqVjYYIf3noruPC1t7lvNxvQ+SMILlnzxxISNR42jzeUfMjsNY5RGjif7z3BrS+V4t9ffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=idWEi6xB; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="idWEi6xB"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1739205130; bh=mX+ebUmMEOvskLo5E36u5VLBcZ76FPJwjr6H1qGKzGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=idWEi6xBymT8NYfWplVq2Ii5SrlggHfw14BFMtcoX+pWIBZbQP9izRSRlSyF4WxaB
	 FmtoaHrubsT27lY0G/cGa9aZ9360lxUHY+u9m0jnlnJfzdh/5oOcGTNybz8jp+I75C
	 /wf/dpym+WHiSbfKlYP5yM4Oq3bAwjm7ij1sOMmw=
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Boris-Chengbiao Zhou <bobo1239@web.de>,  Kees Cook <kees@kernel.org>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Chayim
 Refael Friedman <chayimfr@gmail.com>
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer.py: add missing
 macros deps
In-Reply-To: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
	(Tamir Duberstein's message of "Sun, 09 Feb 2025 12:11:53 -0500")
References: <20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com>
Date: Mon, 10 Feb 2025 17:32:08 +0100
Message-ID: <87a5atbw1j.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@gmail.com> writes:

> The macros crate has depended on std and proc_macro since its
> introduction in commit 1fbde52bde73 ("rust: add `macros` crate"). These
> dependencies were omitted from commit 8c4555ccc55c ("scripts: add
> `generate_rust_analyzer.py`") resulting in missing go-to-definition and
> autocomplete, and false-positive warnings emitted from rust-analyzer
> such as:
>
>   [{
>   	"resource": "/Users/tamird/src/linux/rust/macros/module.rs",
>   	"owner": "_generated_diagnostic_collection_name_#1",
>   	"code": {
>   		"value": "non_snake_case",
>   		"target": {
>   			"$mid": 1,
>   			"path": "/rustc/",
>   			"scheme": "https",
>   			"authority": "doc.rust-lang.org",
>   			"query": "search=non_snake_case"
>   		}
>   	},
>   	"severity": 4,
>   	"message": "Variable `None` should have snake_case name, e.g. `none`",
>   	"source": "rust-analyzer",
>   	"startLineNumber": 123,
>   	"startColumn": 17,
>   	"endLineNumber": 123,
>   	"endColumn": 21
>   }]
>
> Add the missing dependencies to improve the developer experience.
>
> Fixes: 8c4555ccc55c ("scripts: add `generate_rust_analyzer.py`")
> Suggested-by: Chayim Refael Friedman <chayimfr@gmail.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Competing with https://lore.kernel.org/rust-for-linux/20241205115438.234221-1-me@kloenk.dev/
but I do like your aproach more.

Reviewed-by: Fiona Behrens <me@kloenk.dev>

> ---
> Changes in v2:
> - Change macros deps from [core] to [std, proc_macro], improving
>   autocomplete and go-to-definition.
> - Remove Wedson Almeida Filho <wedsonaf@google.com> from cc; email
>   bounced.
> - Link to v1: https://lore.kernel.org/r/20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com
